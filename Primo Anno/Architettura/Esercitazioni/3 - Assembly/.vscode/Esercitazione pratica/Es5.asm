.data 
    numeri: .word 1, 1, 1, 0

.text
    .globl main

main:
    #caricamento dell'array
    la $t0, numeri 
    lw $t1, 0($t0)
    lw $t2, 4($t0)
    lw $t3, 8($t0)

branch:
    bgtz $t1, somma                 #primo valore > 0
    beq $t1, $zero, aand            #primo valore = 0
    bltz $t1, moltiplicazione       #primo valore > 0

somma:
    add $s1, $t1, $t2
    add $s1, $s1, $t3
    sw  $s1, 12($t0)
    j fine

moltiplicazione:
    mul $s1, $t1, $t2
    mul $s1, $s1, $t3
    sw $s1, 12($t0)
    j fine

aand:
    and $s1, $t2, $t3
    sw $s1, 12($t0)
    j fine

fine:
    #stampa risultato
    li $v0, 1
    lw $a0, 12($t0)
    syscall
    #chiusura
    li $v0, 10
    syscall
