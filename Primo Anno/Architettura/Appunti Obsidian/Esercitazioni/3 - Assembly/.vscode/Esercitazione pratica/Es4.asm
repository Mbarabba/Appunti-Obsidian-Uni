.data 
    numeri:     .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
    risultato:  .word 0

.text
    .globl main

    main:
        la $t0, numeri      #caricamento puntatore array
        li $t1 10           #caricamento contatore
        add $s0, $s0, $zero #som E quanti grammi per cucchiaio da tavolo? ma = 0
    
    ciclo:
        beq $t1, $zero, fine    #controllo condizione
        lw $t2, 0($t0)          #carico numero da sommare
        add $s0, $s0, $t2       #aggiorno la somma
        addi $t0, $t0, 4        #punto al prossimo numero
        addi $t1, $t1, -1       #aggiorno contatore
        j ciclo                 #ripeto

    fine:
        #stampa somma
        li $v0, 1
        move $a0, $s0
        syscall       
        
        #termino il programma
        li $v0, 10
        syscall
