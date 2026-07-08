---
tags:
  - vault/campaign
  - type/instructions
  - status/active
---
# AGENTS - Campaign LLM Wiki

## 1. Contesto Del Progetto

Vault LLM wiki per la campagna **La Croce di Ghiaccio**.

Obiettivo principale: mantenere memoria, fonti, cronologia, personaggi, luoghi, fazioni, misteri, quest, stato del mondo e diario narrativo coerenti, navigabili e riusabili.

Il vault serve come memoria persistente della campagna e come supporto per:
- recap delle sessioni;
- preparazione del DM;
- consultazione da parte dei giocatori;
- controllo della continuita narrativa;
- recupero rapido di eventi, PNG, luoghi e fili narrativi;
- distinzione tra canon, speculazione, conoscenza dei personaggi e conoscenza del DM;
- produzione di un diario di viaggio romanzato della campagna.

Il vault mantiene tre livelli distinti:
- RAW: trascrizioni, appunti e materiali grezzi.
- CANON: stato consolidato e verificato della campagna.
- TRAVELOGUE: reinterpretazione narrativa romanzata degli eventi canonici.

Il travelogue non sostituisce il canon e non introduce automaticamente nuovi fatti.

## 2. Struttura Del Vault

`.obsidian/` configurazione locale del vault.

`index.md` punto di ingresso leggero verso indici e pagine chiave.

`purpose.md` obiettivo della campagna-wiki e domande guida.

`regole.md` regole operative del vault.

`log.md` timeline append-only delle attivita svolte sul vault.

`raw/sessions/` trascrizioni grezze delle sessioni da processare.

`raw/lore/` testi grezzi di ambientazione, worldbuilding e storia del mondo.

`raw/character_backgrounds/` background grezzi dei personaggi giocanti.

`raw/handouts/` lettere, mappe testuali, indizi, documenti in-game e materiali consegnati al party.

`raw/archive/` fonti gia processate e archiviate.

`wiki/overview.md` stato consolidato del vault.

`wiki/indexes/` indici tematici, schema dei tag, tassonomia e pagine di navigazione secondarie. L'indice principale resta `index.md`.

`wiki/sessions/` schede normalizzate delle singole sessioni.

`wiki/timeline/` cronologia canonica della campagna.

`wiki/characters/` personaggi giocanti, PNG, antagonisti e figure ricorrenti.

`wiki/factions/` fazioni, casate, culti, gilde, ordini, eserciti e organizzazioni.

`wiki/locations/` citta, regioni, dungeon, edifici, piani, luoghi simbolici.

`wiki/concepts/` concetti ricorrenti, fenomeni, elementi cosmologici o categorie di mondo non riconducibili a singoli luoghi, fazioni o oggetti.

`wiki/quests/` missioni aperte, completate, fallite o sospese.

`wiki/items/` oggetti magici, reliquie, artefatti, documenti importanti e ricompense che richiedono una pagina autonoma.

`wiki/relationships/` relazioni, alleanze, rivalita, debiti, promesse e tensioni tra entita, quando non basta aggiornarle nelle pagine naturali coinvolte.

`wiki/mysteries/` misteri aperti, indizi, sospetti, teorie e rivelazioni.

`wiki/rumors/` voci, dicerie, informazioni incerte e testimonianze non verificate che restano rilevanti oltre una singola pagina naturale.

`wiki/canon/` dossier canonici trasversali o consolidamenti stabili quando non esiste una pagina naturale migliore. Il canon ordinario vive anche in sessioni, timeline, overview, state e pagine naturali.

`wiki/sintesi/` sintesi canoniche stabili, recap estesi e riassunti tematici riusabili.

`wiki/query/` query operative, diagnostiche o esplorative temporanee ancora utili come punto di lavoro. Le `scene-analysis` obbligatorie per ingest e travelogue stanno qui.

`wiki/dm_only/` informazioni riservate al DM, spoiler, verita nascoste e preparazione futura, solo quando esistono contenuti riservati da separare.

`wiki/player_knowledge/` informazioni note ai giocatori o ai personaggi, senza spoiler DM, solo quando serve una vista dedicata player-facing.

`wiki/travelogue/` diario di viaggio romanzato della campagna.

`wiki/travelogue/chapters/` capitoli narrativi principali derivati dalle sessioni.

`wiki/travelogue/interludes/` interludi, scene laterali, sogni, visioni, leggende e scene di atmosfera.

`wiki/travelogue/letters/` lettere, diari in-universe, ballate, cronache e documenti narrativi.

`wiki/travelogue/style-guide.md` guida stilistica del diario di viaggio.

`wiki/travelogue/continuity.md` memoria narrativa per voce, temi, simboli, callback e caratterizzazione.

`wiki/travelogue/index.md` indice del romanzo/diario di viaggio.

`exports/travelogue/docx/` export Word dei capitoli travelogue, quando richiesti o quando viene revisionato sostanzialmente un capitolo.

`wiki/lint/` report di pulizia, controlli strutturali, template e verifiche di coerenza.

`state/world_state.md` snapshot aggiornato dello stato del mondo.

`state/active_threads.md` fili narrativi attivi.

`state/unresolved_hooks.md` agganci, promesse, debiti e indizi non ancora risolti.

`state/npc_status.md` stato aggiornato dei PNG rilevanti.

`state/travelogue_status.md` stato di avanzamento del diario di viaggio.

## 3. Convenzioni

Per i dettagli completi rimanda sempre a `regole.md`.

Tutto il contenuto wiki deve restare in italiano.

Le fonti grezze vanno in `raw/` e poi in `raw/archive/` dopo l'ingest.

Ogni documento nuovo deve avere almeno 3 tag:
- vault;
- tipo;
- dominio narrativo, stato o campagna.

Prima di creare una nuova pagina, controlla se esiste gia una pagina naturale da aggiornare.

Le cartelle specialistiche `wiki/canon/`, `wiki/sintesi/`, `wiki/indexes/`, `wiki/query/`, `wiki/relationships/`, `wiki/rumors/`, `wiki/items/`, `wiki/player_knowledge/` e `wiki/dm_only/` non devono essere popolate automaticamente: usale solo quando una pagina autonoma e davvero utile. Eccezione: le `scene-analysis` di sessione in `wiki/query/` sono obbligatorie prima di scrivere o riscrivere capitoli travelogue.

Aggiorna sempre `index.md` quando vengono create nuove pagine importanti o quando una sessione significativa aggiunge nuovi riferimenti navigabili.

Le trascrizioni raw non sono canon automatico.

Le teorie dei giocatori non sono fatti canonici.

Il travelogue deriva dal canon, non dalle sole trascrizioni raw.

Il romanzo puo aggiungere stile, atmosfera, ritmo e interiorita, ma non puo introdurre nuovi fatti canonici senza marcarli come invenzione narrativa non canonica.

Il canon deve sempre indicare la fonte o la sessione da cui deriva.

Le informazioni DM-only non devono essere mischiate con pagine visibili ai giocatori.

Registra sempre le manutenzioni significative in `log.md`.

## 4. Stato Corrente Del Progetto

### Fatto finora

Bootstrap del vault narrativo completato.

Definita struttura per ingest di sessioni, lore, background, handout e materiali di ambientazione.

Definita struttura per diario di viaggio romanzato:
- capitoli;
- interludi;
- lettere;
- style guide;
- continuity narrativa;
- stato di avanzamento;
- export Word opzionali/operativi.

Predisposte regole per separare raw, canon, speculazione, conoscenza riservata e travelogue.

Ingerite e consolidate le sessioni canoniche S01-S06:
- `wiki/sessions/2026-02-18-la-lanterna-nera.md`;
- `wiki/sessions/2026-03-04-la-porta-e-padre-danik.md`;
- `wiki/sessions/2026-03-11-l-ombra-di-padre-danik.md`;
- `wiki/sessions/2026-03-18-la-luce-di-padre-danik.md`;
- `wiki/sessions/2026-04-01-verso-la-cattedrale-delle-ombre.md`;
- `wiki/sessions/2026-06-17-approdo-alla-cattedrale-delle-ombre.md`.

Aggiornati:
- `wiki/timeline/timeline-canonica.md`;
- `wiki/overview.md`;
- `state/world_state.md`;
- `state/active_threads.md`;
- `state/unresolved_hooks.md`;
- `state/npc_status.md`;
- `state/travelogue_status.md`.

Create pagine naturali per PG, PNG, luoghi, fazioni, oggetti, concetti, quest e misteri principali.

Creati capitoli travelogue 01-06 in stato bozza.

Allineato il workflow del travelogue al modello qualitativo del vault **Sottosuolo**:
- `scene-analysis` obbligatoria in `wiki/query/` prima dei capitoli;
- scrittura scena per scena;
- dialoghi estesi e attribuiti;
- continuity narrativa strutturata;
- style guide dettagliata;
- template capitolo completo;
- checklist ingest/travelogue estese.

### Aperto o in sospeso

Processare eventuali nuove fonti grezze inserite in `raw/sessions/`, `raw/lore/`, `raw/character_backgrounds/` o `raw/handouts/`.

Da verificare dopo S06:
- sbarco presso il villaggio dell'isola della Cattedrale;
- stato reale degli abitanti;
- rapporto tra Cattedrale, Umberlee, Ilmater e Canto;
- ombra assente di Kaelira;
- campane runiche gia viste nella guerra;
- acque corrosive dell'isola;
- uso o conservazione del favore di Sharavin;
- natura della lanterna, di Seraph e di Inferium.

Mantenere aggiornati dopo ogni sessione significativa:
- `wiki/overview.md`;
- `wiki/timeline/timeline-canonica.md`;
- `state/world_state.md`;
- `state/active_threads.md`;
- `state/unresolved_hooks.md`;
- `state/npc_status.md`;
- `state/travelogue_status.md`;
- `wiki/travelogue/index.md`;
- `wiki/travelogue/style-guide.md`, se cambiano decisioni di stile;
- `wiki/travelogue/continuity.md`, se emergono nuove voci, temi, simboli o callback.

### Ultime decisioni prese

Le sintesi canoniche stanno in `wiki/sintesi/`.

Le informazioni stabili e accertate stanno prima nelle pagine naturali, nella timeline, nell'overview e negli stati; `wiki/canon/` serve solo per dossier trasversali o consolidamenti non riconducibili a una pagina naturale migliore.

Il diario di viaggio sta in `wiki/travelogue/`.

Il travelogue e subordinato al canon: puo romanzare la forma, ma non alterare i fatti.

Dopo il consolidamento canonico di ogni nuova sessione raw processata, il travelogue va aggiornato creando sempre un nuovo capitolo dedicato alla sessione o trascrizione fornita. Non estendere capitoli esistenti salvo istruzione esplicita contraria del DM. Lasciare la sessione solo come da romanzare e ammesso solo con istruzione esplicita contraria o fonte insufficiente/incoerente, e va motivato in `state/travelogue_status.md`.

Dopo ogni creazione o revisione sostanziale di un capitolo travelogue Markdown per Obsidian, creare anche il file Word `.docx` corrispondente in `exports/travelogue/docx/`, usando solo `## Testo Narrativo` e senza includere metadati, note di adattamento o sezioni tecniche, quando lo strumento di conversione e disponibile. Se non e disponibile, registrare il mancato export in `log.md` o nella risposta finale.

Le fonti grezze non vanno modificate, ma solo archiviate dopo l'ingest.

In caso di nuova informazione, si preferisce aggiornare la pagina naturale invece di moltiplicare pagine duplicate.

Ogni sessione significativa deve aggiornare:
- scheda sessione;
- scene analysis;
- timeline canonica;
- stato del mondo;
- PNG rilevanti;
- quest;
- misteri;
- fili narrativi aperti;
- nuovo capitolo o bozza travelogue dedicati, oppure stato `da romanzare` solo con motivo esplicito.

## 5. Come Iniziare

Leggi prima:
1. `index.md`;
2. `purpose.md`;
3. `regole.md`;
4. `wiki/overview.md`;
5. `state/world_state.md`.

Se la richiesta riguarda una nuova trascrizione raw, usa sempre `wiki/lint/session-ingest-checklist.md` come checklist operativa. Il metodo obbligatorio e:
1. Dividere la trascrizione in scene: cambio luogo, cambio interlocutori, cambio argomento o cambio posta in gioco.
2. Disambiguare i parlanti usando la mappa Giocatori-PG in `wiki/travelogue/style-guide.md`. Qualsiasi nome non nella mappa = PNG, OOC o rumore da verificare.
3. Creare una `scene-analysis` in `wiki/query/` usando `wiki/lint/template-scene-analysis.md`.
4. Estrarre informazioni scena per scena: eventi, dialoghi estesi, PNG, luoghi, quest, decisioni, OOC scartato.
5. Scartare elementi OOC: riferimenti al DM, meccaniche di gioco, battute meta-gioco, token, mappe, problemi tecnici.
6. Consolidare il canon: scheda sessione, timeline, pagine naturali, stati.
7. Scrivere il travelogue scena per scena, dialoghi estesi, attribuzioni verificate.
8. Creare il Word del travelogue in `exports/travelogue/docx/` dal solo `## Testo Narrativo`, se possibile.

Se la richiesta riguarda una sessione, apri prima:
- `wiki/lint/session-ingest-checklist.md`;
- `wiki/travelogue/style-guide.md`;
- `wiki/sessions/`;
- `wiki/timeline/`;
- `state/active_threads.md`.

Se la richiesta riguarda il diario di viaggio, apri prima:
- `wiki/travelogue/index.md`;
- `wiki/travelogue/style-guide.md`;
- `wiki/travelogue/continuity.md`;
- `state/travelogue_status.md`;
- la scheda sessione corrispondente;
- la `scene-analysis` corrispondente in `wiki/query/`;
- la timeline canonica.

Se la richiesta riguarda un personaggio, apri prima:
- `wiki/characters/`;
- `wiki/relationships/`;
- `state/npc_status.md`.

Se la richiesta riguarda una quest o un mistero, apri prima:
- `wiki/quests/`;
- `wiki/mysteries/`;
- `state/unresolved_hooks.md`.

Se la richiesta e per i giocatori, evita contenuti in `wiki/dm_only/`.

Se la richiesta e per il DM, puoi usare anche `wiki/dm_only/`, ma segnala chiaramente quando la risposta contiene spoiler.

Prima di rispondere a una query, controlla se esiste gia una pagina wiki sull'argomento.

Aggiorna questo file dopo ogni sessione significativa o dopo modifiche strutturali importanti al vault.
