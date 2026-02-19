.data 0x10010000
    numeri : .word 1, 2, 3

.text
    #Caricamento valori
    lw $t0, numeri
    la $t1, numeri  #la e non lw perchè sto caricando l'indirizzo, non il valore
    lw $t2, 8($t1)  #offset di 8 partendo da t1

        #Stampa t0
        li $v0, 1
        move $a0, $t0
        syscall
        li $v0, 11
        li $a0, 10
        syscall

        #Stampa t1
        li $v0, 1
        move $a0, $t1
        syscall
        li $v0, 11
        li $a0, 10
        syscall

        #Stampa t2
        li $v0, 1
        move $a0, $t2
        syscall
        li $v0, 11
        li $a0, 10
        syscall
    
    #Terminazione
    li $v0, 10
    syscall