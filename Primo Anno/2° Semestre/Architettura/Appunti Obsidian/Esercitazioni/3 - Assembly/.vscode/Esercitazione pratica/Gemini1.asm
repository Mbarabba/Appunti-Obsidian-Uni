.data
    array: .word 1,2,3,4,5,6,7,8,9,10

.text
    main :
    la $s0, array       # carico l'indirizzo dell'array all'interno di s0
    move $s1, $zero     # imposto s1 a 0, questo sarà usato per la somma
    move $s1, $zero     # contatore delle operazionoi

    loop:
    beq $t1, 10, stampa # controllo la condizione
    lw $t0, 0($s0)      # carico il valore da sommare
    add $s1, $s1, $t0   # sommo il valore
    addi $s0, $s0, 4    # aggiorno il puntatore
    addi $t1, $t1, 1    # aggiorno il contatore
    j loop              # torno al loop

    stampa:
    move $a0, $s1   # inserisco all'interno di a0 il valore da stampare
    li $v0 , 1      # impartisco alla syscall di stampare a0 tramite v0
    syscall
    li $v0, 10      # termino il programma
    syscall
