.data
    array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37

.text
    .globl main
    
        main:
            la $t0, array   #Questo è il puntatore
            li $t1, 37      #Questo è il contatore      

        ciclo:
            beq $t1, $zero, fine
            lw $t2, 0($t0)      #Copiamo il valore a cui puntiamo
            add $t2, $t2, $t2   #Raddoppio valore di T2   

                #stampa valore
                li $v0 1
                move $a0, $t2
                syscall
                #stampa "\n"
                li $v0, 11
                li $a0, 10
                syscall

            #contatore--
            addi $t1, $t1, -1
            #salvo nuovo valore nell'array 
            sw $t2, 0($t0)
            #ricalcolo puntatore
            addi $t0, $t0, 4

            #Ricomincio il ciclo
            j ciclo

        fine: 
            li $v0, 10


