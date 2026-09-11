# Cosa è?
È una politica di gestione delle scrittura per la memoria cache

È considerata una strategia "pigra" quando la CPU modifica un dato, l'aggiornamento viene registrato solo nella cache e non viene propagato immediatamente alla memoria principale

---
# Cosa fa?
L'obbiettivo è massimizzare le prestazioni di scrittura riducendo al minimo gli accessi alla memoria RAM

Invece di inviare ogni modifica alla memoria, il Write-Back accumula le modifiche all'interno della cache stessa

Questo crea una temporanea incoerenza, il dato in cache è "nuovo", mentre quello in RAM è "vecchio", ma il sistema tiene traccia di questa differenza

---
# Come lo fa?
Per gestire questa incoerenza senza perdere dati, il Write-Back utilizza un bit aggiuntivo per ogni linea di cache, chiamato Dirty Bit $(D)$

## Scrittura (Hit)
 1. La CPU scrive su un blocco presente in cache
 2. La cache aggiorna il dato e imposta il dirty bit a 1
 3. La RAM non viene toccata, la CPU prosegue immediatamente
 4. Se la CPU scrive altre 100 volte sullo stesso blocco, continua ad aggiornare solo la cache
## Sostituzione (Eviction)
Quando un blocco deve essere rimosso dalla cache il controller controlla il Dirty Bit della riga da cancellare
- Se $D=0$ (Clean) il dato non è stato modificato, la riga viene sovrascritta immediatamente 
- Se $D=1$ (Dirty) il dato è diverso dalla RAM, la cache deve prima copiare il blocco nella RAM per salvarlo e solo dopo può sovrascriverlo
---
# Vantaggi e Svantaggi
## Vantaggi
- **Velocità**
  Le operazioni di scrittura avvengono alla velocità della cache, non della RAM
- **Basso Traffico sul Bus**
  Se un programma modifica più volte la stessa variabile, viene generata una sola scrittura in RAM alla fine, invece di migliaia
- **Efficienza Energetica**
  Meno accessi alla memoria principale significano meno consumo di corrente
## Svantaggi
### Dio
- **Incoerenza dei Dati**
  Cache e Ram non sono allineate
  In caso di crash di sistema o spegnimento improvviso, i dati modificati solo in cache vanno persi
- **Complessità Hardware**
  Richiede logica aggiuntiva per gestire il Dirty Bit e la procedura di salvataggio durante la sostituzione
- **Difficoltà con I/O e Multicore**
  Se una periferica o un altro processore vuole leggere quel dato dalla RAM, leggerà un valore vecchio
  Serve hardware complesso per garantire la coerenza
---
# Confronto con le altre tecniche
| Caratteristica     |          Write-Through          |       Write-Through + Buffer       |                Write-Back                 |
| :----------------- | :-----------------------------: | :--------------------------------: | :---------------------------------------: |
| Dove scrive la CPU |           Cache + RAM           |        Cache + Buffer FIFO         |                Solo Cache                 |
| Velocità Scrittura |      Lenta (Velocità RAM)       |     Alta<br>(Velocità Buffer)      |      Altissima<br>(Velocità Buffer)       |
| Coerenza RAM       | Perfetta<br>(Sempre aggiornata) | Quasi perfetta<br>(Ritardo minimo) | Incoerente<br>(Aggiornata solo alla fine) |
| Traffico BUS       |              Alto               | Alto<br>(Non filtra le scritture)  |   Basso<br>(Filtra scritture ripetute)    |
| Stallo CPU         |        Ad ogni scrittura        |        Solo se Buffer pieno        |        Solo se Miss su riga Dirty         |
| Hardware           |            Semplice             |               Medio                |         Complesso<br>(Dirty Bit)          |
## Ciao
**Write-Through Puro:** È la scelta della **sicurezza**. Garantisce che i dati siano sempre salvi in RAM, ma è lento e intasa il bus
- **Write-Through + Buffer:** È il **compromesso**. Maschera la lentezza della RAM usando un buffer, ma non riduce il numero totale di scritture verso la memoria (il bus lavora comunque tanto)
- **Write-Back:** È la scelta della **prestazione**. È l'unico che riduce effettivamente il lavoro della memoria principale, aggregando molte scritture CPU in un'unica scrittura RAM. È la tecnica standard nelle cache L1/L2 dei processori moderni per dati.