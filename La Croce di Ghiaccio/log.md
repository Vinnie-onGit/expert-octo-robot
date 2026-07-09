---
tags:
  - vault/campaign
  - type/log
  - status/maintenance
---
# Log

## 2026-06-17

- Bootstrap del vault **La Croce di Ghiaccio**.
- Creata struttura directory per raw, wiki, stati e travelogue.
- Creati file operativi iniziali, checklist e template capitolo.
- Ingestite le trascrizioni sessione dal 2026-02-18 al 2026-04-01.
- Create schede canoniche sessioni S01-S05, timeline, overview, stati operativi e pagine naturali per PG, PNG, luoghi, fazioni, oggetti e concetti.
- Creati capitoli travelogue 01-05 in stato bozza.
- Archiviate le trascrizioni raw processate in `raw/archive/`.
- Corretto il nome canonico del Camminante: **Numcalad**, mantenendo "il Camminante" come epiteto/alias.
- Integrato lore Forgotten Realms per Shariti, Chiesa di Ilmater e Arpisti, separando note di ambientazione dal canon della campagna.
- Ingerito il diario legacy `raw/sessions/La_Croce_di_ghiaccio.md` come fonte integrativa: corretto il nome canonico della capitana in **Kaelira**, precisati "Inferium", "Mellon", aura divinatoria della lanterna, retaggio celestiale, Seraph e dettagli dello specchio di Edmorin.
- Archiviato il diario legacy in `raw/archive/La_Croce_di_ghiaccio.md`.
- Creata la voce concettuale `wiki/concepts/inferium.md`, consolidando Inferium come mistero aperto legato al Faro Sommerso, alla luce legata, alla voce dal basso e alle varianti d'ascolto Inferi/Inferio.

## 2026-07-08

- Ingerita la trascrizione `raw/sessions/2026-06-17 21-52-46.txt` come S06.
- Creata la scheda canonica `wiki/sessions/2026-06-17-approdo-alla-cattedrale-delle-ombre.md`.
- Aggiornati timeline, overview, stati operativi, pagine naturali su Cattedrale, Kaelira, Canto, Sharavis, lanterna e conchiglia.
- Create le nuove pagine `wiki/locations/villaggio-dell-isola-della-cattedrale.md`, `wiki/factions/culto-di-umberlee.md` e `wiki/items/sacco-antimagia.md`.
- Creato il capitolo travelogue `wiki/travelogue/chapters/capitolo-06-approdo-alla-cattedrale-delle-ombre.md` e aggiornati gli indici travelogue.
- Archiviata la trascrizione raw in `raw/archive/2026-06-17 21-52-46_trascrizione.txt`.
- Importato nel vault il workflow qualitativo del progetto Sottosuolo: `scene-analysis` obbligatoria, checklist ingest/travelogue estese, template capitolo completo, regole travelogue scena-per-scena, dialoghi estesi, continuity strutturata, style guide dettagliata ed export Word in `exports/travelogue/docx/` quando disponibile.
- Create le scene-analysis S05-S06 in `wiki/query/` e revisionati i capitoli travelogue 05-06 con workflow Sottosuolo-quality, dialoghi estesi, sezioni tecniche complete e link di navigazione aggiornati. Export Word non creati per assenza di `pandoc`.
- Revisionati i capitoli travelogue S01-S02 con il nuovo standard Sottosuolo-quality: create le scene-analysis `wiki/query/scene-analysis-2026-02-18-la-lanterna-nera.md` e `wiki/query/scene-analysis-2026-03-04-la-porta-e-padre-danik.md`, riscritti i capitoli 01-02 scena per scena e aggiornati stato/continuity. Export Word non creato in questa revisione.
- Revisionati i capitoli travelogue S03-S04 con il nuovo standard Sottosuolo-quality: create le scene-analysis `wiki/query/scene-analysis-2026-03-11-l-ombra-di-padre-danik.md` e `wiki/query/scene-analysis-2026-03-18-la-luce-di-padre-danik.md`, riscritti i capitoli 03-04 scena per scena e aggiornati sessioni, stato/continuity e indice travelogue. Export Word non creato in questa revisione.
- Verificata l'assenza di `pandoc` nel PATH; gli export Word dei capitoli revisionati restano da generare quando sara disponibile uno strumento di conversione.

## 2026-07-09

- Ingerita la trascrizione `raw/sessions/2026-07-08 22-09-04.txt` come S07.
- Creata la scheda canonica `wiki/sessions/2026-07-08-la-stella-solitaria.md`.
- Creata la scene-analysis `wiki/query/scene-analysis-2026-07-08-la-stella-solitaria.md`.
- Create le nuove pagine `wiki/locations/stella-solitaria.md` e `wiki/characters/vecchio-marinaio.md`.
- Aggiornati timeline, overview, stati operativi, pagine naturali su villaggio, Cattedrale, Canto, Umberlee e PG.
- Creato il capitolo travelogue `wiki/travelogue/chapters/capitolo-07-la-stella-solitaria.md` e aggiornati indice/stato/continuity travelogue.
- Archiviata la trascrizione raw in `raw/archive/2026-07-08 22-09-04_trascrizione.txt`.
- Export Word del Capitolo 07 non creato per assenza di `pandoc`.
- Creato `scripts/vault-save.ps1` per salvataggio Git controllato della sottocartella del vault: verifica raw non archiviati, staged preesistenti, `git diff --check`, staging, commit e push opzionalmente disattivabile.
- Documentata in `regole.md` e `AGENTS.md` la procedura di commit/push esplicita a fine ingest significativo.
- Creato `scripts/export-travelogue-html.ps1` per generare un export HTML completo, responsive e player-facing del travelogue.
- Generato `exports/travelogue/html/index.html` con i capitoli 01-07 usando solo il `## Testo Narrativo`.
- Aggiornati `regole.md`, `AGENTS.md`, `wiki/lint/session-ingest-checklist.md`, `wiki/travelogue/index.md`, `state/travelogue_status.md` e `index.md` per includere l'export HTML nel workflow.
- Aggiornato `scripts/vault-save.ps1` per escludere `.obsidian/` di default durante staging, salvo `-AllowObsidian`.
