.data 
    array: .word    1, 2, 3, 4, 5
    dim: .word      5

.text 
    main:
        lw $t0, dim             #dimensione array
        li $s1, 0               #somma = 0
        la $t1, array       
        jal calcola             #salto alla procedura di calcolo
        
        #stampa della somma
        li $v0, 1
        move $a0, $s1
        syscall
        #termina il programma
        li $v0, 10
        syscall

    calcola:
        lw $t2, 0($t1)
        add $s1, $s1, $t2       #aggiorno la somma
        addi $t1, $t1, 4        #sposto il puntatore al prossimo valroe
        addi $t0, $t0, -1       #contatore--
        bgt $t0, $zero, calcola #controllo condizione
        jr $ra                  #ritorno alla procedura originaria



        

