# Come funziona?
Questo modello si basa sul disaccoppiare **sender** e **receiver**
- Disaccoppiamento **referenziale**
  Il publisher non conosce i subscriber e pubblica notifiche senza sapere chi le riceverà
- Disaccoppiamento **temporale**
  I processi non devono essere attivi contemporaneamente per permettere la comunicazione

![[Pasted image 20260307180336.png]]

La shared data space realizza disaccoppiamento referenziale e temporale, i processi comunicano tramite tuple persistenti cercate per pattern associativo, senza mai riferirsi esplicitamente alle altre componenti

I processi pubblicano notifiche su **event bus** (middleware), che le consegna immediatamente ai soli sottoscritti interessati e attivi in quel momento, senza che le parti debbano conoscersi esplicitamente

---
# Modelli
- **Topic-based**
  Un subscriber si iscrive a un canale, tutti gli eventi pubblicati su quel topic vengono consegnati
- **Content-based**
  La sottoscrizione può contenere predicati su attributi o espressioni simili a query SQL (sui contenuti  del messaggio), rendendo il matching più flessibile ma costoso
---
# Vantaggi e Svantaggi
## Vantaggi 
- Disaccoppiamento Referenziale
- Disaccoppiamento Temporale
- Flessibilità di Matching
- Semplicità di Gestione
- Scalabilità
## Svantaggi
- Complessità del Middleware
- Difficolatà di Tracciamento
- Accoppiamento Temporale Residuo
- Costo di Elaborazione Elevato
---
# Confronto con le altre Architettur