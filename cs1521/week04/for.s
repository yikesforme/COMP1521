
        .data
sum:    .word 4
a:      .word 1,3,5,7,9
        .text

main:
    li $t0, 0   # i = 0
    li $t1, 0   # sum = 0
    li $t2, 4   # max index = 4

for:
    bgt $t0, $t2, end_for
    move $t3, $t0
    mul $t3, $t3, 4
    add $t1, $t1, $t3(a)
    addi $t0, $t0, 1

    j for
end_for:
    sw $t1, sum
    move $a0, $t1
    li $v0, 1
    syscall

li $v0, 0
jr $ra
