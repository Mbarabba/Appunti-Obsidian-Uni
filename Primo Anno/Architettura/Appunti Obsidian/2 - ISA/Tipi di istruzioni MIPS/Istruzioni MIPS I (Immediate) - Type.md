# Cosa sono?
Sono uno dei 3 formati di codifica delle istruzioni MIPS

Si chiamano "immediate" perchè contengono un valore numerico costante direttamente codificato all'interno dei 32 bit dell'istruzione, invece di doverlo cercare in un terzo registro

---
# Cosa fanno?
Vengono usate quando l'operazione richede un dato esterno ai registri

Coprono 3 casistiche principali :
1. **Aritmetica con Costanti**
   Quando vuoi sommare o confrontare un registro con un numero fisso
   `addi`,`slti`,`andi`
2. **Accesso alla Memoria (Load/Store)**
   Per spostare dati tra RAM e Processore
   Il numero immediato serve come "offset" per calcolare l'indirizzo
   `lw`,`sw`
3. **Salti Condizionati**
   Per i costrutti `if-then-else` e i cicli
   Il numero immediato indica di quante istruzione saltate in avanti o indietro
   `beq`,`bne
---
# Struttura
![[Pasted image 20260124145045.png]]
Anche questo formato usa 32 bit, ma la suddivisione avviene su 4 campi

| Campo     |         Nome          |  Bit  | Dimensione |                                              Descrizione                                              |
| :-------- | :-------------------: | :---: | :--------: | :---------------------------------------------------------------------------------------------------: |
| op        |        opcode         | 31-26 |   6 bit    |      Fondamentale qui<br><br>Identifica univocamente l'operazione<br><br>Non c'è il campo funct       |
| rs        |     Sorgente/Base     | 25-21 |   5 bit    |                                    Indirizzo del registro operando                                    |
| rt        | Destinazione/Sorgente | 20-16 |   5 bit    | Nelle operazioni aritmetiche/load è la destinazione<br><br>Nelle store o branch è la seconda sorgente |
| immediate |   valore immediato    | 15-0  |   16 bit   |             Contiene il numero costante o l'indirizzo<br><br>Range [$2^{15}$,$2^{15} -1$]             |

---
# Macchina $\to$ Assembly
Prendiamo il codice esadecimale `0x8D090014`
1. **Hex $\to$ Binario**
   `100011|01000|01001|0000000000010100`
2. **Taglia i bit (6-5-5-16)**
	- op (6 bit) : 100011 $\to$ 35 = lw
	- rs (5 bit) : 01000 $\to$ 8 = `$s8`, essendo questa una lw, questo è il registro di base
	- rt (5 bit) : 01001 $\to$ 9 = `$s9`,  essendo una lw, questa è la destinazione
	- immediate (16 bit) : 0000000000010100 $\to$ 20 , questo è l'offset
3. **Ricostruisci la sintassi Assembly**
   La sintassi per la lw è `lw rt, offset(rs)`
   Risultato : `lw $s9, 20($s8)`
---
# Assembly $\to$ Macchina
Traduciamo `addi $10, $8, 5`
1. **Identificare i valore dei campi**
	- opcode : Cerca addi nella [[Appendice A.pdf ]]  addi = 8 $\to$ `001000`
	- rs (sorgente) : `$8` $\to$ `01000`
	- rt (destinazione) : `$10` $\to$ `01010`
	- immediate : 5 $\to$ `0000000000000101`
2. **Costruisci la stringa binaria**
   opcode+rs+rt+immediate = `001000|01000|01010|0000000000000101`