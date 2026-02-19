# Cos'è?
Lo scheduler della CPU è il componente del sistema operativo responsabile della selezione dei processi.

È il "cervello" che decide quale processo, tra quelli [[Processi#Ready | in stato ready]] ha il diritto di utilizzare il processore in un determinato momento

---
# Cosa fa?
Il suo compito principale è gestire la Ready Queue
- Seleziona un processo dalla coda dei [[Processi#Ready | processi pronto]]
- Alloca un core libero della CPU a quel processo tramite il [[Dispatcher | dispatcher]]
- Gestisce diverse code per processi in stati diversi
---
# Come lo fa?
Lo scheduler prende decisioni in risposta a cambiamenti di stato dei processi, esistono 2 modalità operative principale
## Non-Preemtive (Senza prelazione)
Il processo <u>mantiene la CPU finchè non la rilascia volontariamente.</u>
Se un processo va in **loop infinito**, <u>blocca tutto il sistema</u>
## Preemptive (Con prelazione)
Il sistema operativo <u>può sottrarre forzatamente la CPU</u> a un processo.
È più complesso ma necessario per i sistemi operativi

---
# Valutazione di un algoritmo di scheduling
Le metriche usate per la valutazione sono :
- **Utilizzo CPU**
  La percentuale di tempo in cui la CPU lavora
- **Throughput**
  Numero di processi completati per unità di tempo
- **Tempo di completamento (Turnaround Time)**
  Tempo totale dalla creazione alla terminazione del processo
- **Tempo di attesa**
  Tempo totale trascorso nella **ready queue**
- **Tempo di risposta**
  Tempo tra la richiesta dell'utente e la prima risposta
---
# Algoritmi di Scheduling
>[!definizione]+ **FCFS** - First-Come First-Served (FIFO)
># Logica
>È una coda FIFO
>
>---
>
># Pro
>- Semplice da implementare
># Contro
>- **Effetto convoglio**
>  Se il primo primo processo è lungo, tutti gli altri devono aspettare.
>  <u>Pessimo tempo di attesa medio</u> ^def-FCFS

>[!definizione] **SJF** - Shortest Job First
># Logica
>Sceglie il processo con il [[Multiprogrammazione#CPU Burst | CPU burst]] più breve
>
>---
>
># Pro
>- Ottimo per minimizzare il tempo di attesa medio
># Contro
>- Impossibile da implementare perchè non si può conoscere il futuro
>
>>[!approfondimento] **SRTF** - Shortest Remaining Time First
>># Logica
>>Versione preemptive dell'algoritmo **SJF** (Shortest Job First)
>>
>>---
>>
>>Assegna la CPU al processo col tempo di esecuzione residuo più breve
>># Pro
>>- **Minimizzazione del tempo di attesa**
>>- **Reattività per processi brevi**
>># Contro
>>- **Impossibile conoscere il futuro**
>>- **Starvation**
>>  Se continuano ad arrivare processi con burst più brevi del processo attuale i processi con burst più lunghi potrebbero non essere mai eseguiti
>>- **Overhead**

>[!definizione] **RR** - Round Robin
># Logica
>Assegna a ogni processo una quantità di tempo (**time slice**).
>Se il processo non finisce entro il tempo, viene interrotto e messo infondo alla coda
>
>---
>
># Pro
>- **Garantisce equità**
>- **Ottimi tempi di risposta**
># Contro
>- Se il <u>time slice è troppo piccolo</u>, si perde troppo tempo in context switch
>- Se il <u>time slice è troppo grande</u> diventa un [[Scheduler#^def-FCFS | FCFS]] ^def-RR

>[!definizione] Scheduling a **priorità**
># Logica
>Ogni processo ha una priorità, la CPU esegue il processo con la priorità più alta
>
>---
>
># Problema : **Starvation**
>I processi a bassa priorità potrebbero non essere mai eseguiti
># Soluzione : **Aging**
>Aumentare gradualmente la priorità dei processi che aspettano da tanto tempo
>
>---
># Pro
>- **Gerarchia**
>  Permette di distinguere processi importanti da quelli meno urgenti
>- **Flessibilità delle politiche**
>  Può essere configurato per comportarsi come altri algoritmi
># Contro
>- **Starvation**
>- **Gestione paritaria**
>  Se più processi hanno la stessa priorità, serve un secondo algoritmo (solitamente [[Scheduler#^def-RR | Round Robin]]) per arbitrare

>[!definizione] **MLFQ** - Multi Level Feedback Queue
># Logica
>Ci sono più code con diverse priorità, i processi si spostano tra le code in base al comportamento
>
>- Se un processo usa troppo la CPU, viene spostato in una coda a priorità più bassa
>- Se un processo aspetta molto o fa tanto I/O viene mantenuto o spostato in code a priorità più alta
>
>---
># Pro
>- **Adattivo**
>  Distingue processi I/O bound e CPU bound senza conoscere in anticipo la durata del burst
>- **Ottimo tempo di risposta**
>- **Equità dinamica**
># Contro
>- **Complessità**
>- **Overhead**

## Confronto tra gli algoritmi

| Algoritmo |         Nome completo         | Prelazione  |                        Logica di selezione                         |                      Vantaggi                       |
| :-------: | :---------------------------: | :---------: | :----------------------------------------------------------------: | :-------------------------------------------------: |
|   FCFS    |  First-Come <br>First-Served  | !Preemptive |                          Ordine di arrivo                          |              Semplice da implementare               |
|    SJF    |      Shortest Job First       | !Preemptive |                              Brevità                               |   Garantisce il minimo tempo di attesa possibile    |
|   SRTF    | Shortest Remaining Time First | Preemptive  | Se arriva un processo più breve eseguo quello e lascio il corrente | Ancora più efficiente del SJF per i tempi di attesa |
|    RR     |          Round Robin          | Preemptive  |                             Tempo equo                             |                       Equità                        |
| Priorità  |      Priority Scheduling      |  Entrambi   |                             Importanza                             | Permette di definire l'importanza relativa dei task |
|   MLFQ    |   Multilevel Feedback Queue   | Preemptive  |                        Importanza Dinamica                         |                Flessibile e adattivo                |
