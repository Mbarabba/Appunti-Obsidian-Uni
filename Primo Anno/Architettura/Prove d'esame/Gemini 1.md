# 📝 Simulazione Esame: Architettura degli Elaboratori

## 🔹 PARTE 1: Moduli a Risposta Multipla (Blocco I)

### Modulo 1: Rappresentazione dell'Informazione
> [!QUESTION] Domanda 1.1
> Se $0111$ e $1000$ sono numeri in complemento a due di quattro cifre binarie, quanto vale $(0111 + 1000)$?
> - [x] A) $1111$
> - [ ] B) $0000$
> - [ ] C) $0001$
> - [ ] D) Il risultato non è rappresentabile con quattro cifre (overflow)

> [!QUESTION] Domanda 1.2
> Con una rappresentazione in virgola fissa di 10 bit in grado di rappresentare valori compresi tra $11.45$ e $21.69$, quale errore di approssimazione ($numero - approssimante$) si commette a rappresentare il numero $17.665774$?
> - [ ] A) $0.015336$
> - [ ] B) $-0.015336$
> - [ ] C) $0.001534$
> - [x] D) Nessuna delle altre risposte è corretta

---

### Modulo 2: ISA (Instruction Set Architecture)
> [!QUESTION] Domanda 2.1
> Convertire la seguente istruzione dal formato mnemonico assembly al formato binario: `sub $s0, $s4, $a1`
> *(Nota: $s0 = 16, s4 = 20, a1 = 5$)*
> - [x] A) `0000 0010 1000 0101 1000 0000 0010 0010`
> - [ ] B) `0000 0000 1001 0101 0100 0000 0010 0000`
> - [ ] C) `0000 0010 0001 0100 1000 0000 0010 0010`
> - [ ] D) Nessuna delle precedenti

> [!QUESTION] Domanda 2.2
> Convertire l'istruzione esadecimale `0x8FB00060` nel formato mnemonico assembly:
> - [ ] A) `lw $ra, 16($sp)`
> - [x] B) `lw $s0, 96($sp)`
> - [ ] C) `lw $s4, 0($t1)`
> - [ ] D) `sw $s0, 96($sp)`

---

### Modulo 3: Assembly
> [!QUESTION] Domanda 3.1
> Dato il segmento `.data` che inizia all'indirizzo `0x10008000` contenente le word $(2, 1, 0, 3, 4)$, quale valore assume `$v0` dopo l'esecuzione di `li $s4, 0x10008000` seguito da `lw $v0, 0x0000($s4)`?
> - [x] A) $2$ ✅ 2026-02-09
> - [ ] B) $1$
> - [ ] C) $0$
> - [ ] D) $4$

> [!QUESTION] Domanda 3.2
> Analizzando il seguente codice: `li $t3, 4`, `li $t4, 4`, `bne $t3, $t4, Else`, `add $t0, $t1, $t2`. Quale istruzione viene eseguita dopo il branch?
> - [x] A) L'istruzione `add` (il salto non avviene perché i registri sono uguali) ✅ 2026-02-09
> - [ ] B) L'istruzione `sub` all'etichetta `Else`
> - [ ] C) L'istruzione `nop` successiva alla `add`
> - [ ] D) Viene sollevata un'eccezione di salto non valido

---

### Modulo 4: Circuiti Digitali
> [!QUESTION] Domanda 4.1
> A quale circuito corrisponde un sistema composto da due porte NOR con gli ingressi incrociati e retroazionati?
> - [x] A) Un latch SR creato con porte NOR
> - [ ] B) Un latch D
> - [ ] C) Un latch SR creato con porte AND
> - [ ] D) Un Flip-Flop Master-Slave

> [!QUESTION] Domanda 4.2
> Data una tabella di verità con output $Y=1$ per gli ingressi $ABC$ corrispondenti a $(000, 010, 011, 110, 111)$, qual è la funzione logica in somma di prodotti?
> - [ ] A) $\overline{A}\overline{B}\overline{C} + \overline{A}B\overline{C} + \dots$
> - [x] B) $\overline{A}\overline{B}\overline{C} + \overline{A}B\overline{C} + \overline{A}BC + AB\overline{C} + ABC$ ✅ 2026-02-09
> - [ ] C) $A + B + C$
> - [ ] D) Nessuna delle precedenti

---

## 📝 PRIMO MODULO RISPOSTE APERTE

1. **Assembly:** Scrivere un programma MIPS che scorra un array di 10 interi (indirizzo base in `$s0$`) e ne calcoli la somma totale, salvando il risultato nel registro `$s1$`
   
   ``` asm
   .data
	array: .word 1,2,3,4,5,6,7,8,9,10
		
	.text
		main :
		la $s0, array # carico l'indirizzo dell'array all'interno di s0
		move $s1, $zero # imposto s1 a 0, questo sarà usato per la somma
		move $s1, $zero # contatore delle operazionoi
	
	loop:
		beq $t1, 10, stampa # controllo la condizione
		lw $t0, 0($s0) # carico il valore da sommare
		add $s1, $s1, $t0 # sommo il valore
		addi $s0, $s0, 4 # aggiorno il puntatore
		addi $t1, $t1, 1 # aggiorno il contatore
		j loop # torno al loop
	
	stampa:	
		move $a0, $s1 # inserisco all'interno di a0 il valore da stampare
		li $v0 , 1 # impartisco alla syscall di stampare a0 tramite v0
		syscall
		li $v0, 10 # termino il programma
		syscall
   ```   
1. **Virgola Mobile:** Si descriva il problema dell'overflow e della precisione nella rappresentazione dei numeri in virgola mobile rispetto alla virgola fissa.


---

## 🔹 PARTE 2: Moduli a Risposta Multipla (Blocco II)

### Modulo 5: Datapath
> [!QUESTION] Domanda 5.1
> Nel Register File MIPS32, se `ReadRegister1=01000`, `ReadRegister2=01001` e il segnale di controllo `Write=0`, cosa si avrà in uscita su `ReadData1` e `ReadData2` dopo il fronte attivo del clock?
> - [x] A) I valori correnti dei registri `$8` e `$9` ✅ 2026-02-09
> - [ ] B) Il valore `0x00000032` presente in `WriteData`
> - [ ] C) Valori indefiniti (Z)
> - [ ] D) I valori dei registri `$0` e `$1`

> [!QUESTION] Domanda 5.2
> Facendo riferimento alla CPU multiciclo, quali istruzioni richiedono alla ALU di effettuare una **sottrazione** durante la loro realizzazione?
> - [x] A) `beq`, `sub`, `slt`
> - [ ] B) `add`, `sub`, `lw`
> - [ ] C) `beq` e `sub`
> - [ ] D) Solo `sub`

---

### Modulo 6: Eccezioni
> [!QUESTION] Domanda 6.1
> Nell'architettura di riferimento MIPS32, il gestore delle eccezioni (handler) può essere collocato:
> - [x] A) Solo a partire dalla locazione `0x80000180` ✅ 2026-02-09
> - [ ] B) Ovunque nel segmento `ktext`
> - [ ] C) Ovunque nel segmento `data`
> - [ ] D) Solo nel segmento di stack

> [!QUESTION] Domanda 6.2
> Se il registro `Cause` assume il valore `0x00000014`, quale eccezione si sta verificando?
> - [ ] A) Overflow
> - [ ] B) Syscall
> - [x] C) Errore di allineamento (Adel/Ades) ✅ 2026-02-09
> - [ ] D) Istruzione non valida (Reserved Instruction)

---

### Modulo 7: Interrupt
> [!QUESTION] Domanda 7.1
> Un processore con clock a 10MHz esegue ogni istruzione in 5 cicli. Una periferica genera 4 byte ogni $0.1ms$ ($10kHz$). Se l'handler richiede 200 istruzioni totali per ogni dato, è possibile gestire il trasferimento senza perdere dati?
> - [ ] A) Sì, ma il programma interrotto non avanzerebbe quasi mai (il processore è saturo)
> - [ ] B) No, il processore non ha cicli sufficienti
> - [ ] C) Sì, perché la velocità di lettura è indipendente dal clock
> - [ ] D) Sì, e rimane circa il 50% di tempo CPU libero

> [!QUESTION] Domanda 7.2
> In un ciclo di polling, quale operazione viene tipicamente eseguita per prima per sincronizzare il processore con la periferica?
> - [x] A) Lettura del registro di stato della periferica e verifica del bit "Ready" ✅ 2026-02-09
> - [ ] B) Scrittura immediata del dato in memoria
> - [ ] C) Salto incondizionato alla routine di gestione interrupt
> - [ ] D) Disabilitazione globale degli interrupt

---

### Modulo 8: Gerarchia di Memoria
> [!QUESTION] Domanda 8.1
> Un programma impiega 100ms su una macchina senza cache (RAM access = 50ns). Se si aggiunge una cache con accesso a 1ns e hit rate 0.95, qual è il nuovo tempo di esecuzione approssimativo?
> - [x] A) Circa 7 ms ✅ 2026-02-09
> - [ ] B) Circa 12 ms
> - [ ] C) Circa 22 ms
> - [ ] D) Circa 50 ms

> [!QUESTION] Domanda 8.2
> In una cache **Direct Mapped** composta da 4 blocchi, dove ogni blocco è grande 8 byte (2 word), a quale indice di blocco viene mappato l'indirizzo byte `508`?
> - [ ] A) Blocco 0
> - [ ] B) Blocco 1
> - [x] C) Blocco 3 ✅ 2026-02-09
> - [ ] D) Blocco 2

---

## 📝 SECONDO MODULO RISPOSTE APERTE

1. **Memory Hierarchy:** Data una cache con 4 blocchi da 2 word, calcolare il numero di miss per la sequenza di indirizzi byte: `508, 1016, 510, 24, 540` confrontando una mappatura **Direct-Mapped** e una **Fully-Associative (LRU)**. 
	1. ``` Direct Mapped
		   508 / 8 = 63 % 4 = 3 miss
		   1016 / 8 = 127 % 4 = 3 miss
		   510 / 8 = 63 $ 4 = 3 miss
		   24 / 8 = 3 % 4 = 3 miss
		   540 / 8 = 67 % 4 = 3 miss
	   ```
	2. ``` 
	   508 / 8 = 63 -> 0 miss
	   1016 / 8 = 127 -> 1 miss
	   510 / 8 = 63 -> 0 hit
	   24 / 8 = 3 -> 2 miss
	   540 / 8 = 67 -> 3 miss
	   ```


2. **Datapath:** Descrivere il ruolo del segnale di controllo `RegWrite` e come esso varia tra un'istruzione `add` e un'istruzione `sw`.
	1. In entrambi i casi RegWrite è il segnale di controllo che abilita la scrittura del register file.
	   Nella add RegWrite è impostato ad 1 e  viene usato per aggiornare rd, nella sw RegWrite è impostato a 0, questo perchè non avviene una scrittura sui registri ma all'interno della memoria
3. **Exceptions/Interrupt:** Descrivere la procedura di salvataggio del Program Counter nel registro `EPC` quando si verifica un'interruzione e come avviene il rientro al programma principale.
	1. All'interno del EPC viene salvato l'indirizzo dell'istruzione che ha causato l'eccezzione, successivamente all'interno del pc viene caricato l'indirizzo dell'handler che ha il compito di gestire il problema, dopo che l'handler ha finito il suo lavoro viene caricato all'interno del PC l'indirizzo contenuto all'interno dell'EPC , in caso ci fosse stato un eccezione vera e propria, l'istruzione deve essere rieseguita partendo dalla fetch, in caso ci fosse stata "solo" un interrupt allora l'esecuzione può riprendere dal punto in cui è stata interrotta