# Scrivere una funzione MIPS (find_max) 
# che riceve in $a0 l'indirizzo base di un array di 20 interi e in $a1 la sua dimensione. 
# La funzione deve restituire in $v0 il valore massimo presente nell'array.

.data 
    array: .word -7329, 42, -5, 12894, -992, 0, 753, -21, 6401, -338, 91, -88421, 567, -12, 330, -402, 19, 882, -1, 10555

.text
    main:
    la $a0, array   # carico l'indirizzo
    li $a1, 20      # carico la dimensione
    lw $v0, 0($a0)  # assumo che il primo valore sia anche il più grande all'inzio

    loop:
    beq $a1, $zero, stampa
    lw $t0, 0($a0)  # Carico il numero da confrontare
    subi $a1, $a1, 1# Decremento il contatore
    addi $a0, $a0, 4# Punto al prossimo valore
    bgt $t0, $v0, scambio   # Controllo se t0 > v0
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