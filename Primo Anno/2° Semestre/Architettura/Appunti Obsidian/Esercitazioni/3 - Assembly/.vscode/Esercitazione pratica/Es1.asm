.text
    #Caricamento Valori
    li $s0, 10		
    li $s1, 5
    li $s2, 20
    li $s3, 100

    #Somme
    add $t0, $s0, $s1
    add $t1, $s2, $s3 
    add $t2, $t1, $t0

    #Stampe
        #Output t0
        li $v0 1
        move $a0, $t0
        syscall
        li $v0, 11      
        li $a0, 10        
        syscall        

        #Output t1
        li $v0 1
        move $a0, $t1
        syscall
        li $v0, 11      
        li $a0, 10        
        syscall         
        
        #Output t2
        li $v0 1
        move $a0, $t2
        syscall

    # Terminazione programma
    li $v0 ,10
    syscall
     
    