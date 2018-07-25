
    .data
array:
    .word 5, 4, 7, 6, 8, 9, 1, 2, 3, 0
msg:
    .asciiz "\n"
    .text
    .globl main

main:
    # build stack frame for main()
    sw    $fp, -4($sp)
    sw    $ra, -8($sp)
    la    $fp, -4($fp)
    addi  $sp, $sp, -8
    
    # set args and invoke sumOf()
    la    $a0, array
    li    $a1, 0
    li    $a2, 9
    jal   sumOf

    # collect return value + print
    move  $a0, $v0
    li    $v0, 1
    syscall

    la    $a0, msg
    li    $v0, 11
    syscall

    # pop main() stack frame
    lw    $ra, -4($fp)
    addi  $sp, $sp, 8
    lw    $fp, ($fp)
    j     $ra

# int sumOf(int a[], int lo, int hi)
# {
#    if (lo > hi)
#       return 0;
#    else
#       return a[lo] + sumOf(a, lo + 1, hi);
#}

sumOf:
    sw    $fp, -4($sp)
    sw    $ra, -8($sp)
    sw    $s0, -12($sp)
    la    $fp, -4($sp)
    addi  $sp, $sp, -12

if:
    ble   $a1, $a2, else
    li    $v0, 0
    j     return
else:
    move  $t0, $a0
    move  $t1, $a1
    mul   $t1, $t1, 4
    add   $t0, $t0, $t1
    lw    $s0, ($t0)

    addi  $a1, $a1, 1
    jal   sumOf
    add   $v0, $v0, $s0
    # pop sumOf() stack frame
return:
    lw    $s0, -8($fp)
    lw    $ra, -4($fp)
    addi  $sp, $sp, 12
    lw    $fp, ($fp)
    j     $ra
