    .data
    .text
    .globl main

main:
    sw    $fp, -4($sp)       # push $fp onto stack
    la    $fp, -4($sp)       # set $fp for this function
    sw    $ra, -4($fp)       # save return address
    sw    $t1, -8($fp)       # $s0 is int max;
    sw    $t2, -12($fp)      # $s1 is int tmp;
    sw    $t3, -16($fp)
    addi  $sp, $sp, -20      # reset $sp to last pushed item
    
    li $t1, 0
    li $t2, 1
    li $t3, 10

loop:
    bgt $t2, $t3, end
    mul $t1, $t1, $t2
    addi $t2, $t2, 1
    j   loop
end:
    move $a0, $t1
    li $v0, 1
    syscall

lw    $t3, -16($fp)
lw    $t2, -12($fp)
lw    $t1, -8($fp)
lw    $ra, -4($fp)
la    $sp, 4($fp)
lw    $fp, ($fp)

li    $v0, 0
jr    $ra
