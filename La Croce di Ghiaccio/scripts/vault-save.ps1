param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Message,

    [switch]$NoPush,
    [switch]$DryRun,
    [switch]$AllowRawSessions,
    [switch]$AllowObsidian
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-Git {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments,

        [switch]$AllowFailure
    )

    & git @Arguments
    $exitCode = $LASTEXITCODE

    if ($exitCode -ne 0 -and -not $AllowFailure) {
        throw "git $($Arguments -join ' ') failed with exit code $exitCode"
    }

    return
}

$vaultRoot = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $vaultRoot

Invoke-Git -Arguments @('rev-parse', '--is-inside-work-tree') | Out-Null

$repoRoot = (& git rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0) {
    throw 'Unable to determine git repository root.'
}

$resolvedRepoRoot = (Resolve-Path -LiteralPath $repoRoot).Path
$resolvedVaultRoot = (Resolve-Path -LiteralPath $vaultRoot).Path

if (-not $resolvedVaultRoot.StartsWith($resolvedRepoRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Vault directory is not inside the git repository. Repo root: $repoRoot"
}

$vaultPathspec = $resolvedVaultRoot.Substring($resolvedRepoRoot.Length).TrimStart('\', '/') -replace '\\', '/'
if ([string]::IsNullOrWhiteSpace($vaultPathspec)) {
    $vaultPathspec = '.'
}

$vaultPathspecs = @($vaultPathspec)
if (-not $AllowObsidian) {
    if ($vaultPathspec -eq '.') {
        $vaultPathspecs += ':(exclude).obsidian/**'
    } else {
        $vaultPathspecs += ":(exclude)$vaultPathspec/.obsidian/**"
    }
}

Set-Location -LiteralPath $resolvedRepoRoot

$preStaged = (& git diff --cached --name-only)
if (-not [string]::IsNullOrWhiteSpace(($preStaged -join ''))) {
    'Pre-existing staged changes detected:'
    $preStaged | ForEach-Object { "- $_" }
    throw 'Unstage existing changes before running vault-save.ps1, to avoid committing unintended files.'
}

$status = (& git status --porcelain -- $vaultPathspecs)
if ([string]::IsNullOrWhiteSpace(($status -join ''))) {
    'No vault changes to commit.'
    exit 0
}

$rawSessionsPath = Join-Path $vaultRoot 'raw\sessions'
if ((Test-Path -LiteralPath $rawSessionsPath) -and -not $AllowRawSessions) {
    $rawSessionFiles = @(Get-ChildItem -LiteralPath $rawSessionsPath -File |
        Where-Object { $_.Name -ne 'desktop.ini' }
    )

    if ($rawSessionFiles.Count -gt 0) {
        'Unarchived raw session files found in raw/sessions/:'
        $rawSessionFiles | ForEach-Object { "- $($_.FullName)" }
        throw 'Archive or process raw session files before saving, or rerun with -AllowRawSessions.'
    }
}

'Current changes:'
Invoke-Git -Arguments (@('status', '--short', '--') + $vaultPathspecs)

'Running whitespace check...'
Invoke-Git -Arguments (@('diff', '--check', '--') + $vaultPathspecs) | Out-Null

if ($DryRun) {
    'Dry run requested. No files were staged, committed, or pushed.'
    exit 0
}

'Staging vault changes...'
Invoke-Git -Arguments (@('add', '-A', '--') + $vaultPathspecs) | Out-Null

'Running staged whitespace check...'
Invoke-Git -Arguments (@('diff', '--cached', '--check', '--') + $vaultPathspecs) | Out-Null

$staged = (& git diff --cached --name-only -- $vaultPathspecs)
if ([string]::IsNullOrWhiteSpace(($staged -join ''))) {
    'No staged changes after git add.'
    exit 0
}

'Staged files:'
$staged | ForEach-Object { "- $_" }

'Creating commit...'
Invoke-Git -Arguments @('commit', '-m', $Message) | Out-Null

if ($NoPush) {
    'Commit created. Push skipped because -NoPush was provided.'
    exit 0
}

$upstream = ((& git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>$null) -join '').Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($upstream)) {
    throw 'Current branch has no upstream. Set one with git push -u origin <branch>, then rerun push manually.'
}

'Pushing to upstream...'
Invoke-Git -Arguments @('push') | Out-Null

'Saved vault changes and pushed successfully.'
