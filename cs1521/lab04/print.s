
    .data
x:  .word 3
y:  .word 4
eol:.asciiz "\n"
    
    .text

main:
    lw $t0, x
    lw $t1, y
    add $t0, $t0, $t1
    move $a0, $t0
    li  $v0, 1
    syscall

    la $a0, eol
    li $v0, 4
    syscall

    li $v0, 0
    jr $ra
