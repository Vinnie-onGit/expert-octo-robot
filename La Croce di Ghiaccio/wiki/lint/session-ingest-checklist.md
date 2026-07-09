---
tags:
  - vault/campaign
  - type/checklist
  - domain/ingest
---
# Checklist - Ingest Sessione Raw

## Scopo

Checklist operativa da usare ogni volta che viene caricata una nuova trascrizione in `raw/sessions/`.

Il processo parte dalla fonte raw, consolida il canon e termina sempre con aggiornamento del travelogue, salvo eccezione motivata.

## Prima Di Iniziare

- [ ] Leggere `index.md`.
- [ ] Leggere `regole.md`.
- [ ] Leggere `wiki/overview.md`.
- [ ] Leggere `state/world_state.md`.
- [ ] Individuare la nuova trascrizione in `raw/sessions/`.

## Analisi Scena Per Scena Obbligatoria

- [ ] Leggere la trascrizione raw senza modificarla.
- [ ] Identificare numero sessione, data reale, eventuale data in-game e partecipanti.
- [ ] Dividere la trascrizione in scene logiche: cambio luogo, cambio interlocutori, cambio argomento o cambio posta in gioco.
- [ ] Per ogni scena, disambiguare i parlanti usando la mappa Giocatori-PG in `wiki/travelogue/style-guide.md`.
- [ ] Nomi giocatori o abbreviazioni -> normalizzare al PG corrispondente.
- [ ] Nomi non nella mappa -> considerare PNG, OOC o rumore tecnico da verificare.
- [ ] Creare o aggiornare una `scene-analysis` in `wiki/query/` usando `wiki/lint/template-scene-analysis.md`.
- [ ] Per ogni scena estrarre eventi canonici, dialoghi importanti, PNG, luoghi, quest, misteri, oggetti, informazioni scoperte e decisioni del party.
- [ ] Mantenere i dialoghi importanti come botta e risposta attribuito, non solo come riassunto.
- [ ] Separare fatti canonici, battute fuori gioco, speculazioni, metagame, errori di trascrizione e informazioni incerte.
- [ ] Scartare esplicitamente elementi OOC: riferimenti a DM, meccaniche di gioco, tiri, CD, punti ferita, token, mappe, problemi tecnici, battute meta-gioco e commenti da tavolo.

## Ingest Canonico

- [ ] Creare o aggiornare la scheda in `wiki/sessions/`.
- [ ] Collegare la scheda sessione alla `scene-analysis`.
- [ ] Aggiornare `wiki/timeline/timeline-canonica.md`.
- [ ] Aggiornare personaggi, PNG, fazioni e luoghi coinvolti.
- [ ] Aggiornare quest, misteri, rumor e oggetti nelle pagine naturali o nelle cartelle dedicate solo se serve una pagina autonoma.
- [ ] Aggiornare `state/world_state.md`.
- [ ] Aggiornare `state/active_threads.md`.
- [ ] Aggiornare `state/unresolved_hooks.md`.
- [ ] Aggiornare `state/npc_status.md`.

## Travelogue Finale

- [ ] Leggere `wiki/travelogue/style-guide.md`, inclusa la mappa Giocatori-PG.
- [ ] Leggere `wiki/travelogue/continuity.md`.
- [ ] Leggere la `scene-analysis` della sessione.
- [ ] Creare sempre una nuova bozza in `wiki/travelogue/chapters/` per la sessione o trascrizione fornita.
- [ ] Scrivere scena per scena, usando le scene identificate nell'analisi preliminare.
- [ ] Prima di ogni scena, verificare l'attribuzione di ogni battuta.
- [ ] Scrivere dialoghi in forma estesa, botta e risposta diretto, quando portano carattere, decisioni, rivelazioni o tensione.
- [ ] Condensare solo ripetizioni, OOC, meccaniche e passaggi senza valore narrativo.
- [ ] Inserire dettagli sensoriali, atmosfera e interiorita plausibile senza inventare canon.
- [ ] Escludere elementi OOC: DM, tiri di dado, CD, nomi giocatori, metagame.
- [ ] Non estendere capitoli esistenti salvo istruzione esplicita del DM.
- [ ] Collegare la scheda sessione al nuovo capitolo dedicato.
- [ ] Creare o aggiornare il file Word `.docx` del capitolo in `exports/travelogue/docx/`, usando solo `## Testo Narrativo` e senza metadati o note tecniche, se lo strumento e disponibile.
- [ ] Rigenerare l'export HTML completo in `exports/travelogue/html/index.html` con `scripts/export-travelogue-html.ps1`.
- [ ] Aggiornare `wiki/travelogue/continuity.md` se emergono nuove voci, temi, simboli, callback o promesse narrative.
- [ ] Aggiornare `wiki/travelogue/index.md`.
- [ ] Aggiornare `state/travelogue_status.md`.
- [ ] Se il travelogue non viene aggiornato, indicare in `state/travelogue_status.md` il motivo esplicito: istruzione contraria, fonte insufficiente o fonte incoerente.

## Chiusura

- [ ] Aggiornare `index.md` con nuove sessioni, pagine importanti e punti di ingresso creati.
- [ ] Archiviare la fonte raw in `raw/archive/`.
- [ ] Registrare l'attivita in `log.md`.
- [ ] Verificare che ogni nuova pagina abbia frontmatter con delimitatori `---` all'inizio del file.
- [ ] Verificare che ogni nuova pagina abbia almeno 3 tag.
- [ ] Verificare che le nuove pagine importanti siano linkate da almeno una pagina naturale o indice.

## Regola Sintetica

Raw non e canon automatico. Ogni trascrizione va prima divisa in scene, con parlanti disambiguati tramite la mappa Giocatori-PG. Poi si crea una `scene-analysis`, poi si consolida il canon scena per scena, poi si crea sempre un nuovo capitolo travelogue dedicato con dialoghi estesi e OOC escluso, poi si crea l'export Word del capitolo se possibile, si rigenera l'export HTML completo, poi si aggiornano indice, archivio e log.
