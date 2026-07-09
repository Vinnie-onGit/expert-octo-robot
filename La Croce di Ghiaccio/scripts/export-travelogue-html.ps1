param(
    [string]$OutputPath = 'exports/travelogue/html/index.html'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$vaultRoot = Split-Path -Parent $PSScriptRoot
$chaptersPath = Join-Path $vaultRoot 'wiki\travelogue\chapters'
$resolvedOutputPath = Join-Path $vaultRoot $OutputPath
$outputDirectory = Split-Path -Parent $resolvedOutputPath

function Convert-ToSlug {
    param([Parameter(Mandatory = $true)][string]$Text)

    $slug = $Text.ToLowerInvariant()
    $slug = [regex]::Replace($slug, '[^a-z0-9]+', '-')
    $slug = $slug.Trim('-')
    if ([string]::IsNullOrWhiteSpace($slug)) {
        return 'capitolo'
    }

    return $slug
}

function Convert-InlineMarkdown {
    param([Parameter(Mandatory = $true)][string]$Text)

    $encoded = [System.Net.WebUtility]::HtmlEncode($Text)
    $encoded = [regex]::Replace($encoded, '\[\[([^\]|]+)\|([^\]]+)\]\]', '$2')
    $encoded = [regex]::Replace($encoded, '\[\[([^\]]+)\]\]', '$1')
    $encoded = [regex]::Replace($encoded, '\*\*([^*]+)\*\*', '<strong>$1</strong>')
    $encoded = [regex]::Replace($encoded, '(?<!\*)\*([^*]+)\*(?!\*)', '<em>$1</em>')
    return $encoded
}

function Get-SectionLines {
    param(
        [Parameter(Mandatory = $true)][AllowEmptyString()][string[]]$Lines,
        [Parameter(Mandatory = $true)][string]$Heading
    )

    $start = -1
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i].Trim() -eq $Heading) {
            $start = $i + 1
            break
        }
    }

    if ($start -lt 0) {
        return @()
    }

    $end = $Lines.Count
    for ($i = $start; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match '^##\s+') {
            $end = $i
            break
        }
    }

    return @($Lines[$start..($end - 1)])
}

function Convert-TextLinesToHtml {
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string[]]$Lines)

    $blocks = New-Object System.Collections.Generic.List[string]
    $buffer = New-Object System.Collections.Generic.List[string]

    function Flush-Buffer {
        if ($buffer.Count -eq 0) {
            return
        }

        $text = ($buffer -join ' ').Trim()
        if (-not [string]::IsNullOrWhiteSpace($text)) {
            $blocks.Add("<p>$(Convert-InlineMarkdown $text)</p>")
        }

        $buffer.Clear()
    }

    foreach ($line in $Lines) {
        $trimmed = $line.Trim()

        if ([string]::IsNullOrWhiteSpace($trimmed)) {
            Flush-Buffer
            continue
        }

        if ($trimmed -match '^#\s+') {
            Flush-Buffer
            $blocks.Add("<h3>$(Convert-InlineMarkdown ($trimmed -replace '^#\s+', ''))</h3>")
            continue
        }

        if ($trimmed -match '^[-*]\s+') {
            Flush-Buffer
            $blocks.Add("<p>$(Convert-InlineMarkdown ($trimmed -replace '^[-*]\s+', ''))</p>")
            continue
        }

        $buffer.Add($trimmed)
    }

    Flush-Buffer
    return ($blocks -join [Environment]::NewLine)
}

if (-not (Test-Path -LiteralPath $chaptersPath)) {
    throw "Chapters directory not found: $chaptersPath"
}

if (-not (Test-Path -LiteralPath $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
}

$chapterFiles = @(Get-ChildItem -LiteralPath $chaptersPath -Filter 'capitolo-*.md' -File |
    Sort-Object Name)

if ($chapterFiles.Count -eq 0) {
    throw 'No travelogue chapters found.'
}

$chapters = New-Object System.Collections.Generic.List[object]

foreach ($file in $chapterFiles) {
    $lines = @(Get-Content -LiteralPath $file.FullName -Encoding UTF8)
    $titleLine = $lines | Where-Object { $_ -match '^#\s+' } | Select-Object -First 1
    if ([string]::IsNullOrWhiteSpace($titleLine)) {
        $title = $file.BaseName
    } else {
        $title = ($titleLine -replace '^#\s+', '').Trim()
    }

    $narrativeLines = @(Get-SectionLines -Lines $lines -Heading '## Testo Narrativo')
    if ($narrativeLines.Count -eq 0) {
        continue
    }

    $chapterNumber = if ($title -match 'Capitolo\s+(\d+)') { $Matches[1] } else { '' }
    $slug = Convert-ToSlug $title
    $html = Convert-TextLinesToHtml -Lines $narrativeLines

    $chapters.Add([pscustomobject]@{
        Number = $chapterNumber
        Title = $title
        Slug = $slug
        Html = $html
    })
}

$generatedAt = Get-Date -Format 'yyyy-MM-dd HH:mm'
$chapterCount = $chapters.Count

$navItems = ($chapters | ForEach-Object {
    $shortTitle = $_.Title -replace '^Capitolo\s+\d+\s+-\s+', ''
    "<a href=`"#$($_.Slug)`"><span>$($_.Number)</span>$([System.Net.WebUtility]::HtmlEncode($shortTitle))</a>"
}) -join [Environment]::NewLine

$chapterSections = ($chapters | ForEach-Object {
    $shortTitle = $_.Title -replace '^Capitolo\s+\d+\s+-\s+', ''
@"
<article class="chapter" id="$($_.Slug)">
  <div class="chapter-kicker">Capitolo $($_.Number)</div>
  <h2>$([System.Net.WebUtility]::HtmlEncode($shortTitle))</h2>
  <div class="ornament"></div>
  <div class="prose">
$($_.Html)
  </div>
</article>
"@
}) -join [Environment]::NewLine

$htmlDocument = @"
<!doctype html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>La Croce di Ghiaccio - Diario di Viaggio</title>
  <style>
    :root {
      --ink: #e8edf2;
      --muted: #aeb9c6;
      --dim: #7d8998;
      --paper: rgba(9, 17, 27, 0.82);
      --paper-strong: rgba(12, 24, 38, 0.94);
      --gold: #c9a764;
      --blue: #6fb6c8;
      --deep: #061019;
      --shadow: rgba(0, 0, 0, 0.55);
      --line: rgba(201, 167, 100, 0.32);
      --max: 78ch;
    }

    * { box-sizing: border-box; }

    html { scroll-behavior: smooth; }

    body {
      margin: 0;
      color: var(--ink);
      background:
        radial-gradient(circle at 20% 0%, rgba(111, 182, 200, 0.18), transparent 32rem),
        radial-gradient(circle at 85% 12%, rgba(201, 167, 100, 0.14), transparent 26rem),
        linear-gradient(160deg, #03070d 0%, #081522 46%, #03070d 100%);
      font-family: Georgia, "Times New Roman", serif;
      line-height: 1.7;
      min-height: 100vh;
    }

    body::before {
      content: "";
      position: fixed;
      inset: 0;
      pointer-events: none;
      background-image:
        linear-gradient(rgba(255,255,255,0.025) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255,255,255,0.02) 1px, transparent 1px);
      background-size: 44px 44px;
      mask-image: linear-gradient(to bottom, rgba(0,0,0,0.7), transparent 75%);
    }

    .shell {
      display: grid;
      grid-template-columns: 18rem minmax(0, 1fr);
      min-height: 100vh;
    }

    aside {
      position: sticky;
      top: 0;
      height: 100vh;
      padding: 2rem 1.25rem;
      background: linear-gradient(180deg, rgba(3, 7, 13, 0.96), rgba(8, 21, 34, 0.88));
      border-right: 1px solid rgba(201, 167, 100, 0.22);
      box-shadow: 0 0 4rem var(--shadow);
      overflow: auto;
    }

    .brand {
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: var(--gold);
      font-size: 0.78rem;
      margin-bottom: 0.7rem;
    }

    aside h1 {
      margin: 0 0 1rem;
      font-size: 1.45rem;
      line-height: 1.15;
    }

    .meta {
      color: var(--muted);
      font-size: 0.9rem;
      margin-bottom: 1.5rem;
    }

    nav {
      display: grid;
      gap: 0.45rem;
    }

    nav a {
      color: var(--ink);
      text-decoration: none;
      border: 1px solid rgba(255,255,255,0.07);
      border-radius: 999px;
      padding: 0.55rem 0.75rem;
      background: rgba(255,255,255,0.035);
      transition: border-color 160ms ease, background 160ms ease, transform 160ms ease;
      font-size: 0.92rem;
    }

    nav a:hover {
      border-color: var(--gold);
      background: rgba(201, 167, 100, 0.12);
      transform: translateX(0.15rem);
    }

    nav span {
      display: inline-grid;
      place-items: center;
      width: 1.6rem;
      height: 1.6rem;
      margin-right: 0.45rem;
      border-radius: 50%;
      background: rgba(111, 182, 200, 0.16);
      color: var(--blue);
      font-size: 0.76rem;
    }

    main { min-width: 0; }

    .cover {
      min-height: 90vh;
      display: grid;
      align-content: center;
      padding: 8vw 8vw 4rem;
      position: relative;
      overflow: hidden;
    }

    .cover::after {
      content: "";
      position: absolute;
      right: -8rem;
      bottom: -10rem;
      width: 32rem;
      height: 32rem;
      border: 1px solid rgba(201, 167, 100, 0.22);
      border-radius: 50%;
      box-shadow: inset 0 0 4rem rgba(111, 182, 200, 0.12);
    }

    .cover-card {
      position: relative;
      z-index: 1;
      max-width: 58rem;
      padding: clamp(2rem, 5vw, 4rem);
      background: linear-gradient(145deg, rgba(9, 17, 27, 0.84), rgba(8, 21, 34, 0.56));
      border: 1px solid var(--line);
      border-radius: 2rem;
      box-shadow: 0 2rem 7rem var(--shadow);
    }

    .cover h1 {
      margin: 0;
      font-size: clamp(3rem, 8vw, 7rem);
      line-height: 0.92;
      letter-spacing: -0.06em;
    }

    .subtitle {
      margin-top: 1.25rem;
      color: var(--muted);
      max-width: 42rem;
      font-size: clamp(1rem, 1.8vw, 1.25rem);
    }

    .seal {
      display: inline-flex;
      gap: 0.65rem;
      align-items: center;
      margin-top: 2rem;
      color: var(--gold);
      text-transform: uppercase;
      letter-spacing: 0.14em;
      font-size: 0.78rem;
    }

    .seal::before, .seal::after {
      content: "";
      width: 3rem;
      height: 1px;
      background: var(--line);
    }

    .chapter {
      max-width: calc(var(--max) + 8rem);
      margin: 0 auto 7rem;
      padding: 0 clamp(1.25rem, 5vw, 4rem);
      scroll-margin-top: 2rem;
    }

    .chapter-kicker {
      color: var(--gold);
      text-transform: uppercase;
      letter-spacing: 0.18em;
      font-size: 0.78rem;
      margin-bottom: 0.4rem;
    }

    .chapter h2 {
      margin: 0;
      font-size: clamp(2.2rem, 5vw, 4.4rem);
      line-height: 1;
      letter-spacing: -0.045em;
    }

    .ornament {
      width: min(18rem, 60%);
      height: 1px;
      margin: 1.4rem 0 2.4rem;
      background: linear-gradient(90deg, var(--gold), rgba(111, 182, 200, 0.55), transparent);
    }

    .prose {
      max-width: var(--max);
      padding: clamp(1.25rem, 3vw, 2.5rem);
      background: var(--paper);
      border: 1px solid rgba(255,255,255,0.07);
      border-radius: 1.25rem;
      box-shadow: 0 1.5rem 5rem rgba(0,0,0,0.34);
      backdrop-filter: blur(8px);
    }

    .prose p {
      margin: 0 0 1.08rem;
      font-size: clamp(1.04rem, 1.4vw, 1.18rem);
    }

    .prose p:first-child::first-letter {
      float: left;
      color: var(--gold);
      font-size: 4.7rem;
      line-height: 0.82;
      padding: 0.12rem 0.5rem 0 0;
    }

    .prose strong { color: #f2d28c; }
    .prose em { color: #b8dce6; }

    footer {
      color: var(--dim);
      padding: 3rem 8vw 5rem;
      text-align: center;
      font-size: 0.9rem;
    }

    @media (max-width: 920px) {
      .shell { display: block; }
      aside {
        position: static;
        height: auto;
        border-right: 0;
        border-bottom: 1px solid rgba(201, 167, 100, 0.22);
      }
      nav { grid-template-columns: repeat(auto-fit, minmax(12rem, 1fr)); }
      .cover { min-height: auto; padding-top: 4rem; }
    }

    @media print {
      body { background: white; color: #111; }
      aside, .cover, footer { display: none; }
      .chapter { margin: 0 0 2rem; break-after: page; }
      .prose { border: 0; box-shadow: none; padding: 0; }
    }
  </style>
</head>
<body>
  <div class="shell">
    <aside>
      <div class="brand">La Croce di Ghiaccio</div>
      <h1>Diario di Viaggio</h1>
      <div class="meta">$chapterCount capitoli esportati<br>Generato: $generatedAt</div>
      <nav aria-label="Indice capitoli">
$navItems
      </nav>
    </aside>
    <main>
      <section class="cover">
        <div class="cover-card">
          <div class="brand">Travelogue</div>
          <h1>La Croce di Ghiaccio</h1>
          <p class="subtitle">Un diario romanzato di mare, ombre, fede ferita e memoria sottratta. Questo export contiene solo il testo narrativo dei capitoli, senza metadati tecnici.</p>
          <div class="seal">Cattedrali, campane, lanterne</div>
        </div>
      </section>
$chapterSections
    </main>
  </div>
  <footer>Export HTML generato da <code>scripts/export-travelogue-html.ps1</code>. Il canon resta nelle pagine wiki del vault.</footer>
</body>
</html>
"@

Set-Content -LiteralPath $resolvedOutputPath -Value $htmlDocument -Encoding UTF8
"Exported $chapterCount chapters to $resolvedOutputPath"
