---
tags:
  - vault/campaign
  - type/rules
  - status/canon
---
# Regole - Campaign LLM Wiki

## 1. Scopo Del Vault

Questo vault e una memoria persistente per la campagna **La Croce di Ghiaccio**.

Serve a mantenere coerenti:
- eventi;
- personaggi;
- luoghi;
- fazioni;
- quest;
- misteri;
- oggetti;
- relazioni;
- stato del mondo;
- conoscenza dei giocatori;
- informazioni riservate al DM;
- diario di viaggio romanzato.

Il vault non deve inventare canon. Deve consolidare, collegare e rendere navigabile cio che emerge dalle fonti.

## 2. Tre Livelli Di Memoria

Il vault mantiene tre livelli separati.

### RAW

Fonti grezze:
- trascrizioni;
- audio trascritti;
- appunti del DM;
- chat;
- handout;
- background;
- testi di ambientazione.

Il RAW conserva cosa e stato detto o scritto.

### CANON

Memoria consolidata:
- eventi realmente accaduti;
- stato del mondo;
- timeline;
- personaggi;
- quest;
- misteri;
- conseguenze;
- relazioni.

Il CANON stabilisce cosa e vero nella campagna.

### TRAVELOGUE

Diario di viaggio o romanzo della campagna:
- capitoli narrativi;
- scene romanzate;
- interludi;
- lettere;
- cronache in-universe;
- ballate;
- punti di vista soggettivi.

Il TRAVELOGUE racconta la storia, ma non stabilisce il canon.

Priorita:

```text
RAW -> CANON -> TRAVELOGUE
```

Il travelogue deve derivare dal canon, non sostituirlo.

## 3. Lingua

Tutto il contenuto wiki deve essere scritto in italiano.

Sono ammessi nomi propri, termini tecnici, incantesimi, luoghi o citazioni in lingua originale se fanno parte della campagna.

## 4. Principio Fondamentale

Le fonti raw non sono automaticamente canon.

Una trascrizione contiene:
- dialoghi reali;
- battute fuori gioco;
- errori;
- speculazioni;
- metagame;
- retcon;
- informazioni incomplete;
- bug di trascrizione.

Il canon nasce solo dopo ingest, verifica e consolidamento.

Il travelogue nasce solo dopo il canon o insieme a una scheda sessione gia consolidata.

## 5. Separazione Delle Informazioni

Ogni informazione deve essere classificata, quando utile, come una delle seguenti.

### Canon accertato

Fatto confermato da una sessione, da appunti del DM o da materiale ufficiale della campagna.

### Speculazione

Teoria dei giocatori, ipotesi dei personaggi o deduzione non confermata.

### Rumor

Informazione riferita da PNG, voci, leggende o testimonianze potenzialmente false.

### DM-only

Informazione vera o preparatoria non ancora nota ai giocatori.

### Player knowledge

Informazione nota ai giocatori o ai personaggi, utilizzabile in recap spoiler-free.

### Invenzione narrativa

Elemento stilistico del travelogue usato per atmosfera, ritmo, interiorita o raccordo, ma non valido come canon.

## 6. Regola Anti-Invenzione

Non creare dettagli narrativi non supportati dalle fonti quando si scrivono pagine canoniche.

Se manca un'informazione, scrivere:
- `Non noto`;
- `Non confermato`;
- `Da verificare`;
- `Fonte mancante`;
- `Ipotesi`.

Nel travelogue sono ammessi dettagli stilistici minori, ma solo se non cambiano fatti, motivazioni, conseguenze, geografia, magia, relazioni o lore.

Esempi ammessi nel travelogue:
- descrizioni atmosferiche;
- ritmo della scena;
- brevi raccordi;
- interiorita plausibile;
- scelta di punto di vista;
- condensazione di dialoghi.

Esempi non ammessi senza conferma:
- introdurre un nuovo PNG rilevante;
- cambiare l'esito di una scena;
- rivelare un segreto non ancora noto;
- attribuire una motivazione canonica non confermata;
- aggiungere poteri a un oggetto;
- trasformare una teoria in fatto.

## 7. Gestione Delle Fonti Raw

Le fonti nuove devono essere inserite in:
- `raw/sessions/` per trascrizioni e note di sessione;
- `raw/lore/` per ambientazione e worldbuilding;
- `raw/character_backgrounds/` per background dei PG;
- `raw/handouts/` per materiali in-game;
- `raw/archive/` per fonti gia processate.

Dopo l'ingest, spostare o copiare la fonte lavorata in `raw/archive/`.

Non modificare il contenuto grezzo, salvo correzioni minime di leggibilita chiaramente indicate.

## 8. Workflow Di Ingest Sessione

Quando viene processata una sessione, usare `wiki/lint/session-ingest-checklist.md` come checklist operativa.

### 8.1 Analisi preliminare - scena per scena

Prima di qualsiasi estrazione o scrittura, la trascrizione raw va analizzata scena per scena.

1. Leggere la fonte raw per intero.
2. Identificare data/sessione/numero, se presenti.
3. Dividere la trascrizione in scene logiche. Una scena inizia quando cambia uno o piu dei seguenti elementi:
- luogo fisico;
- gruppo di personaggi coinvolti;
- argomento principale della conversazione;
- interlocutore attivo;
- posta in gioco.
4. Per ogni scena, disambiguare i parlanti:
- usare la mappa Giocatori-PG in `wiki/travelogue/style-guide.md`;
- qualsiasi nome non presente nella mappa va considerato PNG, OOC o rumore da verificare;
- quando il GM usa un nome giocatore invece del nome PG, normalizzare al PG corrispondente;
- in caso di ambiguita, usare il contesto della scena e le sessioni precedenti.
5. Creare una pagina `scene-analysis` in `wiki/query/` usando `wiki/lint/template-scene-analysis.md`.
6. Per ogni scena, estrarre:
- eventi canonici;
- dialoghi importanti, mantenendo botta e risposta attribuito;
- PNG incontrati o citati;
- luoghi visitati o citati;
- quest, misteri, indizi, oggetti;
- informazioni scoperte;
- decisioni del party;
- speculazioni, metagame e battute OOC da scartare.

### 8.2 Consolidamento canonico

Dopo l'analisi scena per scena:
1. Separare fatti, battute, speculazioni e metagame.
2. Creare o aggiornare la pagina in `wiki/sessions/`.
3. Aggiornare la timeline canonica.
4. Aggiornare personaggi, PNG, fazioni e luoghi coinvolti.
5. Aggiornare quest, misteri, rumor e oggetti nelle pagine naturali o nelle cartelle dedicate se serve una pagina autonoma.
6. Aggiornare `state/world_state.md`.
7. Aggiornare `state/active_threads.md`.
8. Aggiornare `state/unresolved_hooks.md`.
9. Aggiornare `state/npc_status.md`.

### 8.3 Travelogue

Il travelogue va scritto seguendo lo stesso metodo scena per scena.

1. Come passaggio naturale finale del consolidamento, creare sempre un nuovo capitolo travelogue dedicato per ogni nuova sessione raw processata, senza estendere capitoli esistenti.
2. Prima di scrivere ogni scena, verificare l'attribuzione di ogni battuta usando la `scene-analysis`.
3. Scrivere i dialoghi in forma estesa, botta e risposta diretto, quando contengono carattere, decisioni, conflitto o rivelazioni.
4. Comprimere solo passaggi ripetitivi, puramente logistici o di atmosfera secondaria.
5. Escludere elementi OOC: riferimenti al DM, meccaniche di gioco, tiri, CD, punti ferita, nomi giocatori, battute meta-gioco e commenti da tavolo.
6. Non lasciare una sessione raw processata senza capitolo travelogue dedicato, salvo istruzione esplicita contraria o impossibilita dovuta a fonte insufficiente o incoerente. In quel caso, registrare in `state/travelogue_status.md` la sessione come da romanzare e indicare il motivo.
7. Creare l'export Word del capitolo travelogue dopo la creazione o revisione sostanziale del Markdown, se lo strumento di conversione e disponibile, salvando il `.docx` in `exports/travelogue/docx/` e usando solo il contenuto di `## Testo Narrativo`.
8. Aggiornare `state/travelogue_status.md`.
9. Archiviare la fonte raw.
10. Aggiornare `index.md` con nuove sessioni, pagine rilevanti e punti di ingresso creati.
11. Registrare l'attivita in `log.md`.

## 9. Struttura Minima Di Una Pagina Sessione

Ogni pagina in `wiki/sessions/` dovrebbe contenere:

```markdown
# Sessione X - Titolo

## Metadati
- Data reale:
- Data in-game:
- Fonte:
- Partecipanti:
- Tag:

## Recap breve

## Recap esteso

## Eventi canonici

## Decisioni del party

## PNG incontrati

## Luoghi visitati

## Quest aggiornate

## Oggetti ottenuti o persi

## Informazioni scoperte

## Misteri, indizi e domande aperte

## Conseguenze sul mondo

## Collegamento travelogue
- Capitolo:
- Stato:

## Note DM-only
```

La sezione `Note DM-only` va omessa o separata se la pagina deve essere leggibile dai giocatori.

## 10. Timeline Canonica

La timeline e una delle fonti piu importanti del vault.

Ogni evento significativo deve indicare:
- quando e accaduto, se noto;
- in quale sessione e emerso;
- quali personaggi o fazioni sono coinvolti;
- quali conseguenze ha prodotto.

Se la data in-game non e nota, usare una dicitura esplicita:

```markdown
## Data in-game non confermata
```

Non forzare date non presenti nelle fonti.

## 11. Stato Del Mondo

`state/world_state.md` deve rappresentare lo snapshot attuale della campagna.

Deve includere, se rilevanti:
- situazione politica;
- guerre o conflitti;
- citta distrutte o cambiate;
- fazioni attive;
- minacce note;
- eventi recenti;
- equilibrio di potere;
- conseguenze delle azioni del party.

Lo stato del mondo va aggiornato dopo ogni sessione significativa.

## 12. Diario Di Viaggio / Travelogue

Il travelogue e la versione narrativa romanzata della campagna.

Deve stare in:

```text
wiki/travelogue/
```

Struttura consigliata:

```text
wiki/travelogue/
├── index.md
├── style-guide.md
├── continuity.md
├── chapters/
├── interludes/
└── letters/
```

Il travelogue puo usare:
- terza persona narrativa;
- prima persona diaristica;
- POV di un personaggio;
- cronaca storica;
- documenti in-universe;
- interludi;
- lettere;
- ballate;
- leggende.

Il travelogue non deve essere una trascrizione ripulita e non deve essere un recap elegante.

Dopo il consolidamento canonico di ogni nuova sessione raw processata, il travelogue va aggiornato creando sempre un nuovo capitolo dedicato alla sessione o trascrizione fornita. I capitoli esistenti non vanno estesi con nuove sessioni, salvo esplicita richiesta contraria del DM.

Dopo ogni creazione o revisione sostanziale di un capitolo Markdown in `wiki/travelogue/chapters/`, deve essere creato anche il relativo file Word `.docx` in `exports/travelogue/docx/`, se lo strumento di conversione e disponibile. L'export Word deve contenere il solo testo narrativo, non frontmatter, metadati, note di adattamento, continuita o collegamenti tecnici.

Deve trasformare il gameplay in racconto:
- eliminando rumore del tavolo;
- condensando ripetizioni;
- mantenendo dialoghi importanti in forma diretta;
- migliorando ritmo e atmosfera;
- conservando eventi canonici;
- preservando la voce dei personaggi;
- evitando spoiler non desiderati.

## 13. Regole Del Travelogue

Ogni capitolo deve derivare da una o piu fonti canoniche e da una `scene-analysis`.

Ogni capitolo deve indicare:
- sessione o sessioni di riferimento;
- fonti canoniche;
- fonti raw;
- scene analysis;
- POV;
- stato: bozza, revisionato, canon-narrativo, da rivedere;
- eventuali liberta narrative prese.

Il travelogue puo aggiungere:
- atmosfera;
- descrizioni sensoriali;
- raccordi;
- ritmo;
- interiorita plausibile;
- forma letteraria.

Il travelogue non puo aggiungere come fatti:
- nuovi eventi;
- nuove rivelazioni;
- nuove relazioni;
- nuove motivazioni;
- nuovi poteri;
- nuovi luoghi importanti;
- nuove conseguenze politiche;
- spoiler DM-only in contenuti player-facing.

Se viene usata una licenza narrativa, segnalarla nella sezione `Note di adattamento`.

## 14. Struttura Minima Di Un Capitolo Travelogue

Ogni capitolo in `wiki/travelogue/chapters/` dovrebbe contenere:

```markdown
# Capitolo X - Titolo

## Metadati
- Sessioni di riferimento:
- Data reale:
- Data in-game:
- POV:
- Stato:
- Target:
- Fonti canoniche:
- Fonti raw:
- Scene analysis:
- Tag:

## Testo Narrativo

## Note Di Adattamento
- Liberta narrative:
- Compressioni:
- Dialoghi ricostruiti:
- Scene omesse:
- Elementi non canonici:
- Informazioni DM-only incluse:

## Continuita Narrativa
- Temi:
- Simboli:
- Callback:
- Evoluzione personaggi:
- Dettagli da ricordare:

## Collegamenti
- Sessione:
- Timeline:
- Personaggi:
- Luoghi:
- Quest:
- Misteri:
- Oggetti:
- Fazioni:

## Stato Revisione
- Prima bozza:
- Revisione stile:
- Revisione canon:
- Approvato da:
```

## 15. Style Guide Del Travelogue

`wiki/travelogue/style-guide.md` governa lo stile del romanzo.

Deve definire:
- tono;
- persona narrativa;
- tempo verbale;
- livello di descrizione;
- gestione dei dialoghi;
- gestione dell'ironia;
- gestione della violenza;
- gestione della magia;
- uso dei POV;
- limiti sulle invenzioni narrative;
- preferenze lessicali;
- parole o formule ricorrenti da evitare;
- mappa Giocatori-PG;
- voci dei PG e dei PNG ricorrenti.

Prima di scrivere un capitolo, leggere sempre `style-guide.md`.

## 16. Continuity Narrativa

`wiki/travelogue/continuity.md` conserva gli elementi letterari ricorrenti.

Deve tracciare:
- voce dei personaggi;
- tic linguistici;
- paure;
- desideri;
- tensioni interne al party;
- simboli;
- temi;
- promesse narrative;
- callback;
- running joke;
- immagini ricorrenti;
- evoluzione emotiva;
- ferite e conseguenze psicologiche.

Questa pagina serve a mantenere uniforme il romanzo nel tempo.

## 17. Stato Del Travelogue

`state/travelogue_status.md` deve tracciare lo stato di avanzamento del diario.

Deve indicare:
- capitoli scritti;
- capitoli in bozza;
- sessioni non ancora romanzate;
- capitoli da revisionare;
- buchi di continuita;
- POV gia usati;
- stile approvato;
- prossime priorita.

## 18. Personaggi

Ogni personaggio rilevante deve avere una pagina naturale in `wiki/characters/`.

La pagina dovrebbe contenere:
- nome;
- tipo: PG, PNG, antagonista, divinita, creatura, altro;
- prima apparizione;
- ultima apparizione;
- status: vivo, morto, disperso, sconosciuto, non confermato;
- posizione attuale, se nota;
- relazioni;
- obiettivi;
- informazioni note ai giocatori;
- informazioni DM-only, se necessarie e separate;
- note di voce narrativa per il travelogue;
- fonti.

Non unire due personaggi con nomi simili senza conferma.

## 19. Fazioni

Ogni fazione rilevante deve avere una pagina in `wiki/factions/`.

La pagina dovrebbe contenere:
- nome;
- tipo;
- leader noti;
- membri noti;
- territori;
- obiettivi;
- alleati;
- nemici;
- rapporto con il party;
- status attuale;
- rappresentazione narrativa nel travelogue;
- fonti.

## 20. Luoghi

Ogni luogo rilevante deve avere una pagina in `wiki/locations/`.

La pagina dovrebbe contenere:
- nome;
- tipo;
- regione;
- descrizione;
- atmosfera narrativa;
- eventi avvenuti;
- PNG collegati;
- fazioni presenti;
- stato attuale;
- segreti o contenuti DM-only, separati se necessario;
- fonti.

## 21. Quest E Fili Narrativi

Le quest vanno tracciate in `wiki/quests/`.

Ogni quest dovrebbe avere:
- titolo;
- status: aperta, completata, fallita, sospesa, abbandonata;
- origine;
- obiettivo;
- party coinvolto;
- PNG/fazioni coinvolti;
- progressi;
- ricompense promesse;
- conseguenze;
- prossimi passi;
- rappresentazione nel travelogue;
- fonti.

`state/active_threads.md` deve elencare i fili narrativi ancora attivi.

`state/unresolved_hooks.md` deve elencare agganci, promesse, debiti, indizi e problemi non risolti.

## 22. Misteri E Rumor

I misteri vanno in `wiki/mysteries/`.

Ogni mistero dovrebbe distinguere:
- fatti confermati;
- indizi;
- teorie;
- sospettati;
- fonti;
- stato: aperto, parzialmente risolto, risolto, falso indizio;
- uso narrativo nel travelogue.

I rumor vanno in `wiki/rumors/` solo quando richiedono una pagina autonoma. Se sono legati a una quest, un mistero, una sessione o un PNG, aggiornare prima la pagina naturale corrispondente.

Un rumor non e canon finche non viene confermato.

Nel travelogue un rumor puo essere presentato come voce, leggenda o percezione soggettiva, non come verita oggettiva.

## 23. Oggetti E Artefatti

Gli oggetti rilevanti vanno in `wiki/items/` solo quando richiedono tracciamento autonomo. Prove, documenti, ricompense o oggetti minori possono restare nella sessione, nella quest o nella pagina del personaggio che li possiede.

Tracciare:
- nome;
- tipo;
- proprietario attuale;
- origine;
- poteri noti;
- poteri sospetti;
- limitazioni;
- storia;
- sessioni in cui appare;
- status: posseduto, perduto, distrutto, venduto, sconosciuto;
- resa narrativa nel travelogue.

## 24. Relazioni

Le relazioni importanti vanno documentate in `wiki/relationships/` o nelle pagine delle entita coinvolte.

Tracciare:
- alleanze;
- rivalita;
- debiti;
- promesse;
- tradimenti;
- legami familiari;
- rapporti romantici;
- rapporti politici;
- relazioni mentor/allievo;
- tensione narrativa;
- evoluzione emotiva.

Ogni relazione importante dovrebbe indicare la fonte.

## 25. Conoscenza Giocatori E DM-only

Non mischiare informazioni spoiler con recap per i giocatori o capitoli player-facing.

Usare, quando serve una vista autonoma:
- `wiki/player_knowledge/` per contenuti noti al party;
- `wiki/dm_only/` per verita nascoste, preparazione futura, segreti e appunti riservati.

Se l'informazione e breve o legata a una pagina naturale, puo restare nella pagina naturale purche sia separata chiaramente e non finisca in contenuti player-facing.

Se una pagina contiene entrambe le cose, separare chiaramente:

```markdown
## Informazioni note ai giocatori

## Informazioni DM-only
```

Il travelogue per i giocatori non deve usare informazioni DM-only.

Un travelogue DM-only e ammesso solo se marcato chiaramente.

## 26. Confidence

Quando un'informazione e incerta, indicare il livello di confidenza.

Valori consigliati:
- alta;
- media;
- bassa;
- non confermata.

Esempio:

```markdown
Confidence: bassa
Fonte: teoria formulata dai giocatori durante la Sessione 8
Status: non confermato
```

## 27. Tag

Ogni pagina wiki deve avere tag in YAML frontmatter con delimitatori `---`.

### Sintassi obbligatoria

Il frontmatter deve essere all'inizio del file, prima del titolo:

```markdown
---
tags:
  - vault/campaign
  - type/session
  - status/canon
---
# Titolo Pagina
```

Senza i delimitatori `---`, Obsidian non riconosce i tag e non li mostra nella visualizzazione grafo.

### Tag minimi

Ogni pagina deve avere almeno 3 tag:
- `vault/campaign`;
- un tag di tipo (`type/...`);
- un tag di dominio, stato o campagna.

### Formati non validi

```markdown
tags: vault/campaign, type/session
# Titolo senza frontmatter delimitato
```

## 28. Naming

Usare nomi file chiari, descrittivi e stabili.

Preferire minuscole, trattini e niente spazi per i nuovi file.

Esempi:

```text
wiki/sessions/sessione-012-il-patibolo-di-vhar.md
wiki/characters/lynera.md
wiki/factions/congrega-cinerina.md
wiki/locations/karth.md
wiki/quests/recuperare-il-sigillo-dambra.md
wiki/travelogue/chapters/capitolo-012-il-patibolo-di-vhar.md
wiki/travelogue/interludes/interludio-il-sogno-di-lynera.md
wiki/travelogue/letters/lettera-di-varos-al-conclave.md
```

Non cambiare nome a una pagina gia linkata senza aggiornare i link interni.

## 29. Link Interni

Usare link wiki quando una pagina cita entita gia esistenti.

Esempio:

```markdown
Il party incontra Kaelira presso la Cattedrale delle Ombre e scopre nuovi indizi sul Canto.
```

Evitare duplicati con nomi leggermente diversi.

Prima di creare una pagina, verificare se esiste gia una variante del nome.

`index.md` e l'indice principale del vault e deve essere aggiornato quando vengono create nuove pagine importanti, quando una sessione significativa aggiunge riferimenti navigabili o quando cambiano i punti di ingresso operativi.

Gli indici in `wiki/indexes/` sono secondari e tematici: non sostituiscono `index.md`.

## 30. Query Operative

Prima di creare una nuova query in `wiki/query/`, controllare se esiste gia:
- una pagina naturale o canonica;
- una sintesi;
- una pagina personaggio;
- una pagina quest;
- una pagina mistero;
- una pagina luogo;
- una pagina travelogue.

Le query devono restare strumenti di lavoro, non sostituti delle pagine canoniche.

Le `scene-analysis` sono l'eccezione operativa: sono obbligatorie per sessioni raw e revisioni travelogue sostanziali.

Quando una query diventa stabile, trasformarla in sintesi o aggiornare la pagina naturale corrispondente.

## 31. Sintesi Canoniche

Le sintesi stabili vanno in `wiki/sintesi/`.

Una sintesi e preferibile a una query quando:
- il contenuto e utile spesso;
- la struttura e consolidata;
- non e solo una domanda temporanea;
- serve come riferimento ricorrente.

## 32. Lint E Manutenzione

Controllare periodicamente:
- pagine senza tag;
- link rotti;
- duplicati di personaggi, luoghi o fazioni;
- quest senza status;
- PNG senza status;
- misteri senza stato;
- sessioni non collegate alla timeline;
- raw processati ma non archiviati;
- informazioni DM-only finite in pagine player-facing;
- capitoli travelogue senza fonti canoniche;
- capitoli travelogue senza `scene-analysis`;
- capitoli travelogue che introducono fatti non canonici;
- capitoli travelogue troppo riassuntivi rispetto alla sessione;
- sessioni raw processate senza capitolo travelogue dedicato o senza motivo esplicito in `state/travelogue_status.md`;
- `index.md` non aggiornato rispetto a nuove pagine o sessioni significative.

I report vanno in `wiki/lint/`.

Le manutenzioni importanti vanno registrate in `log.md`.

## 33. Regola Di Aggiornamento Naturale

Quando emerge una nuova informazione, aggiornare prima la pagina naturale.

Esempi:
- nuova informazione su un PNG -> pagina del PNG;
- nuova informazione su una citta -> pagina del luogo;
- nuova informazione su una fazione -> pagina della fazione;
- nuovo indizio -> pagina del mistero;
- nuova conseguenza globale -> `state/world_state.md`;
- nuova scelta di stile narrativa -> `wiki/travelogue/style-guide.md`;
- nuovo tratto ricorrente di personaggio -> `wiki/travelogue/continuity.md`.

Creare una nuova pagina solo se serve davvero.

Le cartelle specialistiche `wiki/canon/`, `wiki/sintesi/`, `wiki/indexes/`, `wiki/query/`, `wiki/relationships/`, `wiki/rumors/`, `wiki/items/`, `wiki/player_knowledge/` e `wiki/dm_only/` sono cartelle di escalation: vanno popolate solo quando la pagina naturale non basta o quando serve una vista autonoma, ricorrente o riservata.

## 34. Retcon

Se una sessione o il DM corregge informazioni precedenti:
1. Non cancellare silenziosamente la versione vecchia.
2. Segnalare il retcon.
3. Aggiornare il canon.
4. Indicare la fonte della correzione.
5. Aggiornare timeline e pagine collegate.
6. Aggiornare o annotare i capitoli travelogue coinvolti.

Esempio:

```markdown
Nota retcon: nella Sessione 14 e stato chiarito che il Conte Arven non era morto, ma disperso.
```

## 35. Risposte Dell'Agente

Quando l'agente risponde usando il vault:
- deve preferire pagine canoniche e sintesi rispetto alle fonti raw;
- deve considerare canoniche anche le pagine naturali aggiornate, la timeline, l'overview e gli stati, non solo eventuali dossier in `wiki/canon/`;
- deve indicare incertezza quando presente;
- non deve rivelare contenuti DM-only se la richiesta e player-facing;
- deve segnalare conflitti tra fonti;
- deve evitare invenzioni;
- deve proporre aggiornamenti al vault quando trova lacune;
- deve leggere la style guide prima di scrivere travelogue;
- deve distinguere sempre tra canon e resa letteraria.

## 36. Recap Per I Giocatori

I recap per i giocatori devono:
- evitare spoiler DM;
- distinguere fatti, ipotesi e rumor;
- essere leggibili;
- dare priorita a eventi, decisioni e conseguenze;
- ricordare quest aperte e prossimi passi;
- non includere metagame irrilevante.

## 37. Preparazione Per Il DM

La preparazione per il DM puo usare:
- `wiki/dm_only/`;
- misteri;
- unresolved hooks;
- relazioni;
- world state;
- conseguenze delle azioni del party;
- travelogue continuity.

Deve aiutare a preparare:
- scene probabili;
- PNG coinvolti;
- reazioni del mondo;
- ricompense;
- complicazioni;
- continuita narrativa;
- payoff di temi e callback.

Non deve trasformare speculazioni in canon senza conferma del DM.

## 38. Scrittura Del Travelogue

Quando viene richiesto un capitolo narrativo:
1. Leggere `wiki/travelogue/style-guide.md`.
2. Leggere `wiki/travelogue/continuity.md`.
3. Leggere la sessione canonica.
4. Leggere la `scene-analysis` corrispondente; se manca, crearla prima.
5. Leggere timeline e stato del mondo rilevanti.
6. Verificare DM-only e target del testo.
7. Scrivere un nuovo capitolo dedicato alla sessione o trascrizione fornita, senza estendere capitoli esistenti salvo richiesta esplicita.
8. Scrivere scena per scena, con dialoghi estesi e attribuzioni verificate.
9. Compilare note di adattamento.
10. Compilare continuita narrativa del capitolo.
11. Creare o aggiornare il file Word `.docx` corrispondente in `exports/travelogue/docx/`, usando solo `## Testo Narrativo`, se lo strumento e disponibile.
12. Aggiornare `state/travelogue_status.md`.
13. Aggiornare `wiki/travelogue/index.md`.
14. Aggiornare `index.md` se viene creato o revisionato un capitolo rilevante.
15. Registrare il lavoro in `log.md`.

## 39. Log

`log.md` e append-only.

Registrare:
- ingest completati;
- fonti archiviate;
- nuove sezioni create;
- capitoli travelogue creati o revisionati;
- scene-analysis create o revisionate;
- retcon;
- manutenzioni;
- lint importanti;
- aggiornamenti strutturali;
- decisioni operative.

Formato consigliato:

```markdown
## YYYY-MM-DD
- Processata Sessione X.
- Aggiornate timeline, world state, PNG e quest.
- Creata scene-analysis Sessione X.
- Creato Capitolo X del travelogue.
- Archiviata fonte raw.
```

## 40. Priorita Del Vault

In caso di conflitto, usare questa priorita:
1. Decisione esplicita del DM.
2. Pagina canonica aggiornata, inclusi pagine naturali, timeline, overview, state ed eventuali dossier in `wiki/canon/`.
3. Appunti DM.
4. Scheda sessione consolidata.
5. Trascrizione raw.
6. Teorie dei giocatori.
7. Rumor in-game.
8. Travelogue.

Se il conflitto resta aperto, segnalarlo invece di risolverlo arbitrariamente.

## 41. Obiettivo Finale

Il vault deve diventare un Campaign Brain:
- affidabile;
- navigabile;
- aggiornabile;
- utile al DM;
- utile ai giocatori;
- capace di preservare memoria lunga;
- capace di evitare incoerenze;
- capace di distinguere canon, rumor, teorie e spoiler;
- capace di trasformare la campagna in un diario narrativo coerente.

Ogni aggiornamento deve aumentare la chiarezza della campagna, non il rumore.
