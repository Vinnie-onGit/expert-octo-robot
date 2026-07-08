---
tags:
  - vault/campaign
  - type/instructions
  - status/active
---
# AVVIO-CHAT - Campaign LLM Wiki

## Contesto Del Progetto

Vault LLM wiki per la campagna **La Croce di Ghiaccio**.

Obiettivo: mantenere memoria, fonti, cronologia, personaggi, luoghi, fazioni, misteri, quest, stato del mondo e diario narrativo coerenti, navigabili e riusabili.

Il vault mantiene tre livelli distinti:
- **RAW:** trascrizioni, appunti e materiali grezzi.
- **CANON:** stato consolidato e verificato della campagna.
- **TRAVELOGUE:** reinterpretazione narrativa romanzata degli eventi canonici.

Le trascrizioni raw non sono canon automatico. Il travelogue deriva dal canon, non dalle sole trascrizioni raw.

## Struttura Del Vault

- `index.md` punto di ingresso.
- `purpose.md` obiettivo del vault.
- `regole.md` regole operative.
- `log.md` timeline append-only delle manutenzioni.
- `raw/` fonti grezze.
- `wiki/` contenuto consolidato.
- `state/` snapshot operativi.

## Regole Rapide

- Tutto il contenuto wiki deve restare in italiano.
- Ogni nuovo documento deve avere almeno 3 tag: `vault/campaign`, tipo, dominio/stato.
- Prima di creare nuove pagine, controlla se esiste gia una pagina naturale da aggiornare.
- Le fonti raw non vanno modificate; dopo l'ingest vanno archiviate in `raw/archive/`.
- Le informazioni DM-only non vanno mischiate con pagine visibili ai giocatori.
- Registra sempre le manutenzioni significative in `log.md`.

## Ingest Sessioni

Per nuove trascrizioni in `raw/sessions/`, usare `wiki/lint/session-ingest-checklist.md`.

Metodo obbligatorio:
1. Dividere la trascrizione in scene.
2. Disambiguare i parlanti usando `wiki/travelogue/style-guide.md`.
3. Estrarre eventi, dialoghi, PNG, luoghi, quest e decisioni scena per scena.
4. Scartare OOC, meccaniche e battute meta.
5. Consolidare canon.
6. Scrivere un nuovo capitolo travelogue dedicato.

## Stato Corrente

Vault bootstrap creato. Nessun contenuto canonico inserito.
