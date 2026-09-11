# Cos'è?
È la politica di gestione della scrittura più semplice e intuitiva per la memoria cache

Il principio fondamentale è la sincronizzazione immediata, ogni volta che la CPU modifica un dato, quella modifica deve essere registrata istantaneamente sia nella Cache che nella Memoria Principale

---
# Cosa fa?
Il suo obbiettivo primario è garantire la coerenza assoluta dei dati

Fa in modo che la memoria RAM contenga sempre l'ultima versione aggiornata dei dati, evitando che esistano disallineamenti tra ciò che vede la CPU e ciò che è salvato nella memoria centrale

---
# Come lo fa?
Il meccanismo è sequenziale e diretto, senza l'uso di bit di stato complessi

Ecco i passaggi operativi:
1. **Richiesta di scrittura**
   La CPU invia l'istruzione di scrittura per un dato indirizzo
2. **Aggiornamento Cache**
   Se il dato è presente nella cache (Hit), viene aggiornato
3. **Aggiornamento RAM**
   Contemporaneamente, il controller della memoria invia lo stesso dato alla RAM per essere scritto all'indirizzo fisico corrispondente
4. **Attesa (Stallo)** 
   Nella versione senza buffer, la CPU deve aspettare la scrittura lenta nella RAM sia completata prima di procedere con l'istruzione successiva

---
# Vantaggi e Svantaggi
## Vantaggi
- **Semplicità Hardware**
  Facile da progettare, non serve il dirty bit nè la logica per controllare se un blocco va salvato prima di cancellarlo
- **Coerenza Perfetta**
  La RAM ha sempre i dati validi
  Questo è cruciale in sistemi dove altri componenti
- **Robustezza**
  In caso di guasto improvviso, i dati sono già salvati in RAM
## Svantaggi
- **Lentezza Estrema**
  La CPU è costretta a operare alla velocità della RAM per ogni singola scrittura
  Se la RAM è 100 volte più lenta, la CPU si ferma 100 cicli per ogni `store`
- **Alto Traffico sul Bus**
  Ogni singola modifica genera un accesso alla memoria. Se modifichi una variabile 1000 volte in un ciclo, intasi il bus con 1000 scritture verso la RAM
---
# Confronto 
| Caratteristica     |          Write-Through          |       Write-Through + Buffer       |                Write-Back                 |
| :----------------- | :-----------------------------: | :--------------------------------: | :---------------------------------------: |
| Dove scrive la CPU |           Cache + RAM           |        Cache + Buffer FIFO         |                Solo Cache                 |
| Velocità Scrittura |      Lenta (Velocità RAM)       |     Alta<br>(Velocità Buffer)      |      Altissima<br>(Velocità Buffer)       |
| Coerenza RAM       | Perfetta<br>(Sempre aggiornata) | Quasi perfetta<br>(Ritardo minimo) | Incoerente<br>(Aggiornata solo alla fine) |
| Traffico BUS       |              Alto               | Alto<br>(Non filtra le scritture)  |   Basso<br>(Filtra scritture ripetute)    |
| Stallo CPU         |        Ad ogni scrittura        |        Solo se Buffer pieno        |        Solo se Miss su riga Dirty         |
| Hardware           |            Semplice             |               Medio                |         Complesso<br>(Dirty Bit)          |