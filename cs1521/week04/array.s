    .text
    .data
array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    .globl main

main:
    sw    $fp, -4($sp)
    la    $fp, -4($sp)
    sw    $ra, -4($fp)
    sw    $s0, -8($fp)
    sw    $s1, -12($fp)
    sw    $s2, -16($fp)
    addi  $sp, $sp, -20

    li    $s0, 0
    li    $s1, 10
    li    $s2, 4 
    la    $s3, array

loop:
    bge   $s0, $s1, end_loop
    lw    $v0, ($s3)
    jal   print
    addi  $s3, $s3, 4
    addi  $s0, $s0, 1
    j     loop
end_loop:
    lw    $s2, -16($fp)
    lw    $s1, -12($fp)
    lw    $s0, -8($fp)
    lw    $ra, -4($fp)
    la    $sp,-4($fp)
    lw    $fp, ($fp)

    jr    $ra

print:
    li    $v0, 1
    syscall
