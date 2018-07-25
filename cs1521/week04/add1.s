    .data
x:  .word 0x00400014
y:  .word 0x00400014
ms: .asciiz "\n"
    .text

main:
    li $v0, 5
    syscall

    sw $v0, x

    li $v0, 5
    syscall

    sw $v0, y
   
    lw $t0, x
    lw $t1, y

    add $a0, $t0, $t1

    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, ms
    syscall

    li $v0, 0
    jr $ra
