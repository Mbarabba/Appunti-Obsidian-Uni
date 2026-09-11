# 📝 Simulazione Esame: Architettura degli Elaboratori (Prova B - No Pipeline)

## 🔹 PARTE 1: Moduli a Risposta Multipla (Fondamenti)

### Modulo 1: Rappresentazione dell'Informazione
> [!QUESTION] Domanda 1.1
> Qual è il range (intervallo) di numeri interi rappresentabili in **Complemento a Due** utilizzando $N=8$ bit?
> - [ ] A) Da $-127$ a $+128$
> - [x] B) Da $-128$ a $+127$ ✅ 2026-02-09
> - [ ] C) Da $0$ a $+255$
> - [ ] D) Da $-256$ a $+255$

> [!QUESTION] Domanda 1.2
> Nello standard IEEE 754 a precisione singola (32 bit), il valore speciale **Infinity** ($\infty$) è rappresentato da:
> - [x] A) Esponente $= 255$ (tutti 1) e Mantissa $= 0$ ✅ 2026-02-09
> - [ ] B) Esponente $= 0$ e Mantissa $= 0$
> - [ ] C) Esponente $= 255$ e Mantissa $\neq 0$ (NaN)
> - [ ] D) Bit di segno $= 1$, tutto il resto a 0

---

### Modulo 2: ISA (Instruction Set Architecture)
> [!QUESTION] Domanda 2.1
> Nel formato di istruzione **Tipo-I** (immediato) del MIPS, quanti bit sono riservati al campo **immediato/offset**?
> - [ ] A) 6 bit
> - [x] B) 16 bit ✅ 2026-02-09
> - [ ] C) 26 bit
> - [ ] D) 32 bit

> [!QUESTION] Domanda 2.2
> L'istruzione `jal` (Jump And Link) in MIPS effettua un salto e contemporaneamente:
> - [x] A) Salva l'indirizzo dell'istruzione successiva (`PC+4`) nel registro `$ra` ($31$) ✅ 2026-02-09
> - [ ] B) Salva l'indirizzo corrente (`PC`) nello stack
> - [ ] C) Azzera il registro `$v0`
> - [ ] D) Disabilita gli interrupt

---

### Modulo 3: Assembly
> [!QUESTION] Domanda 3.1
> Dato il seguente codice:
> ```
> li $t0, 10
> li $t1, 0
> loop:
>    sub $t0, $t0, 2
>    addi $t1, $t1, 1
>    bne $t0, $zero, loop
> ```
> Quale valore conterrà il registro `$t1` al termine dell'esecuzione?
> - [ ] A) 10
> - [x] B) 5 ✅ 2026-02-09
> - [ ] C) 4
> - [ ] D) Il loop è infinito

> [!QUESTION] Domanda 3.2
> Qual è la differenza tra l'istruzione `lb` (Load Byte) e `lbu` (Load Byte Unsigned)?
> - [x] A) `lb` estende il segno del byte caricato a 32 bit, `lbu` estende con zeri ✅ 2026-02-09
> - [ ] B) `lb` carica dati dalla ROM, `lbu` dalla RAM
> - [ ] C) `lbu` è più veloce di `lb`
> - [ ] D) Non c'è differenza, sono sinonimi

---

### Modulo 4: Circuiti Digitali
> [!QUESTION] Domanda 4.1
> Applicando il Teorema di De Morgan all'espressione $\overline{A \cdot B}$, si ottiene:
> - [ ] A) $\overline{A} \cdot \overline{B}$
> - [x] B) $\overline{A} + \overline{B}$ ✅ 2026-02-09
> - [ ] C) $A + B$
> - [ ] D) $A \cdot B$

> [!QUESTION] Domanda 4.2
> Qual è la differenza principale tra un **Latch** e un **Flip-Flop**?
> - [x] A) Il Latch è sensibile al livello del segnale (Level Triggered), il Flip-Flop al fronte (Edge Triggered) ✅ 2026-02-09
> - [ ] B) Il Flip-Flop non ha bisogno di clock
> - [ ] C) Il Latch può memorizzare 2 bit, il Flip-Flop solo 1
> - [ ] D) Il Latch è usato solo per la memoria Cache

---

## 📝 PRIMO MODULO RISPOSTE APERTE

1. **Assembly:** Scrivere una funzione MIPS (`find_max`) che riceve in `$a0` l'indirizzo base di un array di 20 interi e in `$a1` la sua dimensione. La funzione deve restituire in `$v0` il valore **massimo** presente nell'array.
   ```assembly
   .data
	array: .word -7329, 42, -5, 12894, -992, 0, 753, -21, 6401, -338, 91, -88421, 567, -12, 330, -402, 19, 882, -1, 10555
	.text
		main:
		la $a0, array # carico l'indirizzo
		li $a1, 20 # carico la dimensione
		lw $v0, 0($a0) # assumo che il primo valore sia anche il più grande all'inzio
	
		loop:	
		beq $a1, $zero, stampa
		lw $t0, 0($a0) # Carico il numero da confrontare
		subi $a1, $a1, 1# Decremento il contatore
		addi $a0, $a0, 4# Punto al prossimo valore
		bgt $t0, $v0, scambio # Controllo se t0 > v0
		j loop	  
		
		scambio:
		move $v0, $t0 # scambiamo i valori
		j loop	  
		
		stampa:	
		# stampa
		move $a0, $v0
		li $v0, 1
		# terminazione del programma
		syscall
		li $v0, 10
		syscall
   ```
1. **Virgola Fissa:** Si consideri un sistema in virgola fissa Q(5.3) (5 bit interi, 3 frazionari) in Complemento a 2. Determinare la **risoluzione** (il più piccolo incremento possibile) e il **valore minimo** rappresentabile.
   **Dati:** * $m = 5$ (bit interi) * $n = 3$ (bit frazionari) **1. Risoluzione (LSB):** $$2^{-n} = 2^{-3} = \frac{1}{8} = \mathbf{0.125}$$ **2. Valore Minimo:** $$-2^{(m-1)} = -2^{(5-1)} = -2^4 = \mathbf{-16}$$
2. **Circuiti:** Disegnare lo schema logico di un **Multiplexer 2:1** (due ingressi dati, un selettore, un'uscita) utilizzando porte logiche elementari (AND, OR, NOT). Scriverne l'espressione booleana.
   ![[Screenshot_20260209-173545-display-0.jpg.jpg]]

---

## 🔹 PARTE 2: Moduli a Risposta Multipla (Architettura Avanzata)

### Modulo 5: Datapath
> [!QUESTION] Domanda 5.1
> Nel datapath a ciclo singolo, il segnale di controllo **ALUSrc** determina:
> - [ ] A) Se l'operazione ALU è una somma o una sottrazione
> - [x] B) Se il secondo operando dell'ALU proviene dal Register File o dall'estensione del segno dell'immediato ✅ 2026-02-09
> - [ ] C) Se il risultato dell'ALU deve essere scritto in memoria
> - [ ] D) Se il Program Counter deve essere aggiornato con un salto

> [!QUESTION] Domanda 5.2
> In una implementazione **Multiciclo** del processore MIPS, quanti cicli di clock sono necessari per completare un'istruzione `lw` (Load Word)?
> - [ ] A) 3 cicli
> - [ ] B) 4 cicli
> - [x] C) 5 cicli ✅ 2026-02-09
> - [ ] D) 1 ciclo (come nel ciclo singolo)

---

### Modulo 6: Eccezioni
> [!QUESTION] Domanda 6.1
> Qual è la differenza tra l'istruzione `add` e l'istruzione `addu` (unsigned) nel MIPS per quanto riguarda le eccezioni?
> - [x] A) `add` solleva un'eccezione in caso di overflow, `addu` ignora l'overflow ✅ 2026-02-09
> - [ ] B) `addu` solleva eccezioni solo per numeri negativi
> - [ ] C) Non c'è differenza nelle eccezioni, cambia solo il calcolo
> - [ ] D) `add` è usata per gli indirizzi di memoria, `addu` per i dati

> [!QUESTION] Domanda 6.2
> In caso di **Undefined Instruction** (codice operativo non riconosciuto), il processore:
> - [ ] A) Esegue una `nop` e prosegue
> - [x] B) Solleva un'eccezione interna e passa il controllo all'handler ✅ 2026-02-09
> - [ ] C) Spegne il clock per risparmiare energia
> - [ ] D) Esegue l'istruzione interpretandola come una somma

---

### Modulo 7: Interrupt
> [!QUESTION] Domanda 7.1
> Come fa la CPU a distinguere tra diversi dispositivi che richiedono un Interrupt?
> - [x] A) Leggendo il registro **Cause** (o interrogando i dispositivi in polling se la linea è condivisa) ✅ 2026-02-09
> - [ ] B) Guardando il valore del Program Counter
> - [ ] C) Non può distinguerli, li gestisce tutti insieme
> - [ ] D) Usando il registro `$ra`

> [!QUESTION] Domanda 7.2
> Cosa si intende per **Memory Mapped I/O**?
> - [ ] A) Una parte della RAM è riservata solo al Sistema Operativo
> - [x] B) I registri delle periferiche sono mappati nello stesso spazio di indirizzamento della memoria e si accede con `lw`/`sw` ✅ 2026-02-09
> - [ ] C) Le periferiche hanno una memoria cache dedicata
> - [ ] D) L'I/O avviene solo tramite istruzioni speciali `in` e `out`

---

### Modulo 8: Gerarchia di Memoria
> [!QUESTION] Domanda 8.1
> Quale principio fondamentale permette alle cache di essere efficaci?
> - [x] A) Il principio di Località (Spaziale e Temporale) ✅ 2026-02-09
> - [ ] B) La legge di Moore
> - [ ] C) La frequenza elevata della CPU
> - [ ] D) La dimensione ridotta dei bus

> [!QUESTION] Domanda 8.2
> In una cache **Set-Associative a 2 vie**, se un blocco di memoria può essere collocato nel set 5, quante posizioni fisiche alternative ha a disposizione all'interno di quel set?
> - [ ] A) 1 sola posizione
> - [x] B) 2 posizioni ✅ 2026-02-09
> - [ ] C) Qualsiasi posizione nella cache
> - [ ] D) 4 posizioni

---

## 📝 SECONDO MODULO RISPOSTE APERTE

1. **Memory Hierarchy:** Si consideri un indirizzo a 32 bit e una Cache Direct Mapped di dimensione **16 KB** con blocchi da **16 Byte**. Calcolare il numero di bit destinati a: **Tag**, **Index** e **Offset**.
   ```
    offset = lg_2(16)=4
    numero blocchi = (16 * 2^10)/16 = 104
    index = lg_2(1024) = 10
    TAG = 32 - 14 = 18 
   ```
2. **Datapath (Multiciclo):** Descrivere le operazioni svolte in ciascuno dei cicli (step) necessari per l'esecuzione dell'istruzione `beq` (Branch on Equal) in un'architettura Multiciclo. Specificare quali segnali di controllo sono attivi nell'ultimo ciclo.
	```
	L'operazione di beq è svolta in 3 cicli di clock
	
	1. Fetch : Caricamento all'interno dell'instruction register l'indirizzo dell'istruzione attualmente contenuta del PC.
	   Dopo ciò aggiornamio il PC a PC+4
	2. Decode : I contenuti dell'instructio register vengono inviati all'FSM per decidere l'operazione da svolgere attraverso l'opcode, vengono inviati ad A e B i valori di rs ed rt e contemporaneamente viene mandato agli shifter il valore da estendere in un potenziale indirizzo di salto la prossima fase
	3. Execute : La ALU esegue A - B e in caso di condizione soddisfatta il PC viene sovrascritto con l'indirizzo di branch
	   
	   
	```
3. **Exceptions/Interrupt:** Confrontare le tecniche di gestione dell'Input/Output: **Polling** (interrogazione programmata) vs **Interrupt**. Quali sono i vantaggi e gli svantaggi di ciascun approccio in termini di efficienza della CPU?
   ```
   Interrogazione programmata : La CPU interroga ciclicamente ogni periferica se ha bisogno di effettuare una operazione di I/O
	   Vantaggi : 
		   Bassa Latenza
			Facile da implementare
		Svantaggi : 
			La CPU non è in grado di svolgere alcuna funzione oltre al polling
	Interrupt : La periferica invia alla CPU un segnale di interrupt (che viene gestito come se fosse una eccezione) per fare in modo che appena la CPU possa gestisca l'interrupt, portando al congelamento della istruzione corrente appena finisce la fase d'esecuzione corrente (Fetch,Decode,Execute)
		Vantaggi :
			La CPU non è bloccata in uno stato di interrogazione continuo
		Svantaggi :
			Complicata da implementare
			Alta latenza
   ```
   