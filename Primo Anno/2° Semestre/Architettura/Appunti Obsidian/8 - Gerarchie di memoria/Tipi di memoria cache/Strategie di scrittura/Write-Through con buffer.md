# Cos'è?
È una tecnica che inserisce una piccola memoria temporanea ad altissima velocità (chiamata Write-Buffer) tra la cache e la memoria principale

Il buffer è organizzato come una coda FIFO, i dati entrano in ordine e vengono scritti nella RAM nello stesso ordine

---
# Cosa fa?
Il suo scopo è il disaccoppiamento temporale, serve ingannare la CPU facendole crede che la scrittura nella RAM sia istantanea

La CPU "scarica" il pacchetto (dato + indirizzo) nel buffer e torna subito a lavorare, senza aspettare che il pacchetto arrivi effettivamente a destinazione

---
# Come lo fa?
Ecco cosa succede quando la CPU esegue un'istruzione di scrittura
1. **Scrittura nel Buffer**
   La CPU scrive il dato e l'indirizzo nel Write Buffer
   Essendo fatto di registri veloci, questa operazione dura pochissimo
2. **Sblocco CPU**
   Appena il dato è nel buffer, la CPU considera l'operazione conclusa e passa all'istruzione successiva, non c'è stallo
3. **Scrittura Asincrona**
   Mentre la CPU esegue altri calcoli, il controller della memoria svuota il buffer, prendendo i dati uno alla volta e scrivendoli nella RAM ai suoi ritmi lenti
## Problema della saturazione/stallo
Il buffer ha una capacità limitata
- **Caso normale**
  La CPU scrive, poi fa calcoli, poi scrive ancora
  Il buffer ha tempo di svuotarsi
- **Caso critico**
  Se la CPU esegue una raffica di scritture consecutive, riempie il buffer più velocemente di quanto la RAM riesca a svuotarlo
	- Quando il buffer è pieno, la CPU deve fermarsi (Write Stall) e aspettare che si liberi almeno un posto
	  In quel momento, le prestazioni crollando al livello del [[Write-Through]] puro
---
# Vantaggi e Svantaggi
## Vantaggi
- **Elimina le attese**
  Trasforma le operazioni di scrittura lente in operazioni veloci, a patto che non siano troppe tutte insieme
- **Semplicità relativa**
  È più semplice da implementare rispetto al [[Write-Back]]
- **Coerenza garantita**
  I dati arrivano alla RAM nell'ordine esatto
## Svantaggi
- **Non risolve la larghezza di banda**
  Anche se la CPU non aspetta, il bus verso la memoria è comunque occupato per ogni singola scrittura
- **Rischio Saturazione**
  Se il programma comporta tante scritture, il buffer si riempie subito e il vantaggio sparisce
- **Complessità di lettura**
  Se la CPU vuole leggere un dato che è ancora nel buffer, l'hardware deve essere capace di "pescarlo" dal buffer, altrimenti leggerebbe un dato vecchio della RAM
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