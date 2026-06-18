# Cos'è?
È l'insieme dell'hardware che esegue fisicamente le istruzioni del processore

L'esecuzione di un'istruzione non avviene in un unico colpo, ma è suddivisa in una sequenza di passi elementari (ognuno dura 1 ciclo di [[Clock]]), questo approccio permette di :
1. **Riutilizzare le risorse**
   Usare la stessa unità più volte per scopi diversi nella stessa istruzione
2. **Migliorare l'efficienza**
   Le istruzioni semplici durano meno cicli di quelle complesse
---
# Da cosa è composto?
>[!info] Elementi di memoria architetturali
>Sono i componenti che mantengono lo stato del programma tra un'istruzione e l'altra
>1. **Program Counter (PC)**
>   Registro che contiene l'indirizzo dell'istruzione corrente
>2. **Memoria Unica**
>   Un solo blocco hardware che contiene sia istruzione che dati
>3. [[Register File]]

>[!info] Registri temporanei
>Sono registri "invisibili" al programmatore, fondamentali per "parcheggiare" i dati tra un passo e l'altro dell'esecuzione
>1. **IR (Instruction Register)**
>   Salva l'istruzione letta dalla memoria per non perderla mentre la memoria viene usata per l'altro
>2. **MDR (Memory Data Register)**
>   Salva il dato letto dalla memoria (durante una `lw`) prima di scriverlo nel [[Register File]]
>3. **A e B**
>   Salvano gli operandi letti dal [[Register File]] per mantenerli stabili nell'[[ALU - Aritmetic Logic Unit|ALU]]
>4. **ALUOut**
>   Salva il risultato dell'ALU per riutilizzarlo nel ciclo successivo

>[!info] Unità Funzionali Condivise
>1. [[ALU - Aritmetic Logic Unit]]
>   Unità di calcolo universale, esegue somme, sottrazioni, operazioni logiche, calcola indirizzi di memoria e incrementa il PC
>2. **Sign Extend**
>   Estende i 16 bit immediati a 32 bit
>3. **Shift Left 2**
>   Moltiplica per 4 gli offset (per branch e jump)

>[!info] Sistema di smistamento ([[Multiplexer]])
>1. **MUX Memoria (`IorD`)**
>   Sceglie se indirizzare la memoria con il PC (per leggere istruzioni) o con ALUOut (per leggere dati)
>2. **MUX ALU-A (`ALUSrcA`)**
>   Sceglie il promo ingresso [[ALU - Aritmetic Logic Unit|ALU]] tra PC e Registro A
>3. **MUX ALU-B (`ALUSrcB`)**
>   Sceglie il secondo ingresso ALU tra Registro B costante a 4 (per PC+4), immediato esteso (per offset)
>4. **MUX Scrittura (`MemtoReg`)**
>   Sceglie se scrivere nel registro il risultato dell'ALU (ALUOut) o il dato della memoria (MDR)
>5. **MUX Sorgente PC (`PCSource`)**
>   Sceglie il nuovo PC tra:
>	- PC incrementato
>	- Target del salto (Jump)
>	- Target del Branch

![[Pasted image 20260201175121.png]]

---
# Cosa fa?
Esegue le istruzioni MIPS scomponendole in una sequenza temporale di passi elementari, dove ogni passo dura esattamente un ciclo di clock

Le più semplici (Jump / Branch) vengono completate in 3 cicli

Le più complesse (come la Load Word) richiedono fino a 5 cicli

---
# Come lo fa?
Il funzionamento è orchestrato dalla [[Unità di controllo del Datapath]] che, ciclo dopo ciclo, configura i [[Multiplexer]] e i segnali di scrittura per guidare i dati attraverso i componenti condivisi e i registri temporanei

Ecco la sequenza operativa dettagliata : 

>[!info] Ciclo 1 : Fetch
># Cosa fa questa fase?
>Preleva l'istruzione della memoria per salvarla nel processore e calcola l'indirizzo della prossima istruzione $(PC+4)$
># Che cosa serve per farla?
>- PC : Fornisce l'indirizzo
>- Memoria : Legge l'istruzione
>- IR (Instruction Register) : Memorizza l'istruzione letta
>- [[ALU - Aritmetic Logic Unit|ALU]] : Esegue la somma per incrementare il PC
>- [[Multiplexer|MUX]] :
>	- `IorD` : Per l'indirizzo memoria
>	- `ALUSrcA` e `ALUSrcB` : Per gli ingessi ALU
>	- `PCSource` : Per aggiornare il PC
>
>![[Pasted image 20260201124756.png]]
># Come la fa?
>1. Il PC invia l'indirizzo alla memoria
>2. La memoria legge il dato e lo scrive nel registro IR
>3. Contemporaneamente, l'ALU calcola il nuovo PC
>	- Ingresso A = PC
>	- Ingresso B = 4
>	- L'ALU esegue una somma
>4. Il risultato $(PC+4)$ viene scritto nel PC

>[!info] Ciclo 2 : Decode
># Cosa fa questa fase?
>Decodifica l'istruzione (leggendo l'Opcode), legge i valori dai registri indicati nell'istruzione e calcola preventivamente l'indirizzo di un eventuale salto condizionato
># Che cosa serve per farla?
>- IR : Fornisce i numeri dei registri e l'offset immediato
>- Register File : Fornisce i dati letti
>- Registri A e B : Memorizzano i dati letti
>- [[ALU - Aritmetic Logic Unit|ALU]] : Calcola l'indirizzo del branch
>- Sign Extend e Shift Left 2 : Per estendere e scalare l'offset
># Come lo fa?
>1. Vengono letti i due registri specifici nei bit 25-21 e 20-16 dell'IR
>   I valori vengono salvati nei registri temporanei A e B
>2. In parallelo, l'ALU calcola l'indirizzo di un eventuale branch
>	- Ingresso A = PC
>	- Ingresso B = Offset esteso e shiftato
>	- Il risultato viene salvato nel registro ALUOut
>3. L'unità di controllo valuta l'Opcode per determinare il prossimo stato

>[!info] Ciclo 3 : Execute
>In questa fase la FSM configura i multiplexer per eseguire l'operazione specifica
>Vediamo cosa succede ciclo per ciclo per ogni classi di istruzione
>>[!definizione] Istruzioni jump
>>È l'istruzione più semplice dal punto di vista dell'esecuzione
>># Ciclo 3 : Execute (Completamento Jump)
>>- Cosa fa? : Aggiorna incondizionatamente il PC
>>- Componenti : PC, Logica di concatenazione indirizzo
>>- Azione : Il nuovo indirizzo viene scritto direttamente nel PC
>
>>[!definizione] Istruzione Branch
>>Questa istruzione è rapida perchè deve solo decidere se saltare o meno
>># Ciclo 3 : Execute
>>- Cosa fa? : Verifica la condizione di uguaglianza e aggiorna il PC se necessario
>>- Componenti : ALU, Registri A e B, PC
>>- Azione : L'ALU calcola $A-B$, se il risultato è zero, il PC viene sovrascritto con l'indirizzo di target (pre-calcolato e salvato in `ALUOut` durante la decode)
>
>>[!definizione] Istruzione R-Type (`add`,`sub`,`and`,`or`,`slt`)
>>Queste  istruzioni completano il lavoro in 4 cicli : calcolo e scrittura del risultato
>># Ciclo 3 : Execute (Operazione ALU)
>>- Cosa fa? : L'ALU esegue l'operazione aritmetica o logica (determinata dal campo funct) sugli operandi A e B
>>- Componenti : ALU, Registri A e B
>>- Azione : Il risultato viene salvato nel registro ALUOut
>># Ciclo 4 : Completion (Scrittura Registro)
>>- Cosa fa? : Scrive il risultato nel registro di destinazione del [[Register File]]
>>- Componenti : [[Register File]], ALUOut
>>- Azione : Il valore ALUOut viene scritto nel registro destinazione
>
>>[!definizione] Istruzioni di Accesso alla memoria (`lw`,`sw`)
>>Queste istruzioni richiedono il maggior numero di cicli perchè devono calcolare l'indirizzo, accedere alla memoria e (per la Load) scrivere nel registro
>># Ciclo 3 : Execute (Calcolo Indirizzo)
>>- Cosa fa? : L'ALU calcola l'indirizzo di memoria sommando il registro base e l'offset immediato esteso di segno
>>- Componenti : ALU, Registro A, Sign Extend
>>- Azione : Il risultato viene salvato nel registro temporaneo ALUOut
>># Ciclo 4 : Memory Access
>>- Cosa fa? : Si usa l'indirizzo calcolato per accedere alla memoria
>>- Se è `sw` : Scrive il valore del registro B in memoria all'indirizzo indicato da ALUOut, **l'istruzione termina qui**
>>- Se è `lw` : Legge il dato dalla memoria all'indirizzo ALUOut e lo salva nel registro temporaneo MDR
>># Ciclo 5 : Write-Back (Solo per `lw`)
>>- Cosa fa? : Scrive il dato letto dalla memoria nel registro di destinazione
>>- Componenti : [[Register File]], MDR
>>- Azione : Il valore di MDR viene scritto nel registro destinazione

---
# Confronto col datapath multiciclo

| Caratteristica        |                                                 Singolo-Ciclo                                                 |                                             Multi-Ciclo                                             |
| :-------------------- | :-----------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------: |
| Durata ciclo di clock |                              Lungo<br><br>Determinato dall'istruzione più lenta                               |                            Corto<br><br>Determinato dal passo più lento                             |
| Cicli per istruzione  |                            Fisso a 1<br><br>Ogni istruzione richiede 1 solo ciclo                             |                  Variabile (3-5)<br><br>Dipende dalla complessità dell'istruzione                   |
| Memoria               | Duplicata<br><br>Dati e Istruzioni sono in 2 memorie separate per poter essere accessibili contemporaneamente | Unica / Condivisa<br><br>Una sola memoria per dati e istruzioni <br>Viene acceduta in cicli diversi |
| ALU e Sommatori       |                Multipli<br><br>Serve una ALU principale + sommatori dedicati per PC+4 e branch                |                               Unica<br><br>L'ALU principale fa tutto                                |
| Registri Temporanei   |                      Nessuno<br><br>I dati fluiscono direttamente da un blocco all'altro                      |                                              Necessari                                              |
| Unità di controllo    |                  Logica di combinatoria<br><br>I segnali dipendono solo dall'Opcode corrente                  |              FSM<br><br>Una macchina a stati finiti che cambia stato ciclo dopo ciclo               |
| Efficienza Temporale  |                              Bassa<br><br>Spreca tempo sulle istruzioni semplici                              |                Alta<br><br>Ogni istruzione usa solo il tempo strettamente necessario                |
| Costo Hardware        |                              Alto<br><br>Richiede più memoria e sommatori extra                               |                  Ottimizzato<br><br>Risparmia hardware riutilizzando i componenti                   |
## Sintesi del confronto
- **Datapath Singolo Ciclo**
  Segue la filosofia "tutto e subito", ogni istruzione viene completata in un ciclo di clock
  
  Poichè ka durata del ciclo deve essere sufficiente per l'istruzione più lenta (la `lw`), le istruzioni veloci (`j`,`beq`) sprecano molto tempo inattivo
  
  Richiede di duplicare l'hardware perchè non può usare lo stesso componente due volte nello stesso ciclo
- **Datapath Multi-ciclo**
  Segue la filosofia "passo dopo passo", ogni istruzione è divisa in stadi più piccolo
  
  Il ciclo di clock è molto più breve e veloce, le istruzioni durano un numero variabile di cicli (da 3 a 5), quindi le istruzioni veloci non sono penalizzate da quelle lente
  
  Grazie ai registri temporanei, può riutilizzare le stesse unità funzionali in momenti diversi dell'esecuzione