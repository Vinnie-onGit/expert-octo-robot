---
tags:
  - vault/campaign
  - type/rules
  - status/active
---
# Regole Operative

## Lingua

Tutto il contenuto wiki deve essere scritto in italiano.

## Livelli Di Fonte

- **RAW:** trascrizioni e materiali grezzi. Non sono canon automatico.
- **CANON:** contenuto verificato e consolidato, sempre con fonte.
- **TRAVELOGUE:** resa narrativa romanzata basata sul canon.

## Nuovi Documenti

Ogni nuovo documento deve avere frontmatter iniziale con almeno 3 tag:
- `vault/campaign`
- tag tipo (`type/session`, `type/npc`, ecc.)
- tag dominio o stato (`status/canon`, `domain/travelogue`, ecc.)

## Creazione Pagine

Prima di creare una nuova pagina, controllare se esiste gia una pagina naturale da aggiornare.

Non popolare automaticamente cartelle specialistiche (`wiki/canon/`, `wiki/sintesi/`, `wiki/query/`, `wiki/dm_only/`, ecc.) se una pagina naturale e sufficiente.

## Sessioni Raw

Le trascrizioni in `raw/sessions/` vanno processate con `wiki/lint/session-ingest-checklist.md`.

Dopo l'ingest:
- creare/aggiornare scheda sessione;
- aggiornare timeline e stati;
- creare un capitolo travelogue dedicato;
- archiviare la fonte raw in `raw/archive/`;
- registrare l'attivita in `log.md`.

## DM-Only

Le informazioni riservate al DM devono stare in `wiki/dm_only/` e non essere mischiate con contenuti player-facing.
