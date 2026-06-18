# Cos'è?
L'ALU a 1 bit è il circuito combinatori elementare che costruisce il cuore di un processore

È progettata per elaborare una singola "fetta" di informazione : il bit $i-$esimo di due operandi $(A_{i}\text{ e }B_{i})$ e il riporto proveniente della posizione precedente (CarryIn)

Collegando in serie 32 di questi blocchi, si ottiene un'unità capace di calcolare numeri interi a 32 bit

---
# Operazioni supportate
L'ALU esegue diverse operazioni in parallelo, il [[Multiplexer | MUX]] sceglie quale rendere effettiva

## Operazioni Logiche (Bitwise)
Operano sui bit come valori booleani indipendenti
- **[[Porta AND | AND]]** : Selezionato quando serve mascherare dei bit
- **[[Porta OR|OR]]** : Selezionato quando serve unire dei bit
- [[Porta NOT|NOT]] e [[Porta NOR|NOR]] si ottengono negando gli ingressi o invertendo l'uscita
## Operazioni Aritmetiche
Operano sui bit come numeri, propagando il riporto (Carry)
- [[Aritmetica Binaria - Ottale - Esadecimale#➕ Somma|Somma (ADD]] : Esegue $A+B+\text{CarryIn}$
- [[Aritmetica Binaria - Ottale - Esadecimale#➖ Sottrazione|Sottrazione (SUB)]] : Esegue $A-B$, realizzata attivando l'inverter su $B$ impostando il CarryIn iniziale a 1 $(\text{logica }A+\overline{B}+1)$
## Operazioni di Confronto e Salto
- **SLT (Set Less Than)** : Verifica se $A<B$
	- L'ALU esegue una sottrazione, invece di usare il risultato numerico, prende un ingresso speciale chiamato Less
	- Solo per L'ALU del bit meno significativo, questo ingresso è collegato al bit di segno del risultato (MSB), permettendo di scrivere "1" se il numero è negativo
- **Branching (BEQ - Branch if Equal)
	- L'ALU esegue una sottrazione $(A-B)$, se il risultato è 0, significa che i numeri sono uguali, questo attiva un segnale (Zero Flag)
## Rilevamento Overflow
- Questo controllo avviene solo nell'ALU del bit più significativo
	- Una [[Porta XOR]] confronta il riporto in entrata $(C_{in})$ con quello in uscita $(C_{out})$, se sono diversi $(1 \oplus 0 \text{ e } 0 \oplus 1)$, segnala **overflow** (errore di rappresentazione in numeri con segno)
---
# Flusso di esecuzione
Il segreto dell'ALU è il calcolo parallelo
1. <u>Input</u> : I dati $A \text{ e }B$ arrivano all'ALU
2. <u>Esecuzione Simultanea</u> :
	1. La [[Porta AND]] calcola subito $A \cdot B$
	2. La [[Porta OR]] calcola subito $A+B$
	3. Il full Adder calcola la somma e il nuovo Riporto
3. <u>Selezione</u> : Il processore invia un codice al [[Multiplexer |MUX]] 
   ("00" = AND, "10" = Somma), il MUX apre solo quella "strada" e manda quel valore all'uscita `Result`
4. <u>Propagazione</u> : Il CarryOut generato dal Full Adder esce da questa ALU ed entra immediatamente nel CarryIn della ALU successiva
---
# Da cosa è costituita?
1. <u>**Logic Unit**</u> 
	- Una [[Porta AND]] per il prodotto logico
	- Una [[Porta OR]] per la somma logica
2. <u>**Arithmetic Unit**</u>
	- Un Full Adder che gestisce la somma dei bit $A,B$ e del riporto CarryIn
3. **<u>Selector</u>**
	- Un [[Multiplexer]] finale che riceve in ingresso i risultati AND, OR, Full Adder e Slt
	- In base ai segnali di controllo, decide quale di questi risultati far uscire su `Result`
4. <u>**Inverter**</u>
	- Posto sull'ingresso $B$, fondamentale per trasformare le somme in sottrazione ([[CA2 - Complemento a 2|Complemento a 2]])

## Rappresentazione completa
![[Pasted image 20260129110807.png]]
## Rappresentazione simbolica
![[Pasted image 20260129111046.png]]

---
# Costruire una ALU a 32 bit
Per passare da 1 a 32 bit, si collegano 32 di questi circuiti a catena :
- **Dati** : Ogni ALU riceve i bit corrispondenti
- **Controllo** : I segnali di selezione arrivano identici a tutte e 32 le ALU
- **Riporto (Ripple Carry)** : Il riporto viaggia da bit 0 al bit 31 come un'onda
## Rappresentazione completa
![[Pasted image 20260129111356.png]]