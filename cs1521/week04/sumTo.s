
    .data
ask:
    .asciiz "Enter +ve integer: "
out1:
    .asciiz "Sum 1.."
out2:
    .asciiz " = "
eol1:
    .asciiz "\n"

    .text

main:
    # set uo stack frame

    sw    $fp, -4($sp)      # push $fp onto stack
    la    $fp, -4($sp)      # set $fp for this function
    sw    $ra, -4($fp)      # save return address
    sw    $s0, -8($fp)      # $s0 is int max
    sw    $s1, -12($fp)     # $s1 is int temp
    addi  $sp, $sp, -16     # reset $sp

    # code for main

    la    $a0, ask
    li    $v0, 4
    syscall

    li    $v0, 5
    syscall
    move  $s0, $v0

    move  $a0, $s0
    jal SumTo
    move  $s1, $v0

    la    $a0, out1
    li    $v0, 4
    syscall

    move  $a0, $s0
    li    $v0, 1
    syscall

    la    $a0, out2
    li    $v0, 4
    syscall

    move  $a0, $s1
    li    $v0, 1
    syscall

    la    $a0, eol1
    li    $v0, 4
    syscall

    li    $v0, 0
    
    # clean up stack frame

    lw    $s1, -12($fp)
    lw    $s0, -8($fp)
    lw    $ra, -4($fp)
    la    $sp, 4($fp)
    lw    $fp, ($fp)

    jr    $ra

# this is the function

SumTo:
    # set up stack for the function
    sw    $fp, -4($sp)
    la    $fp, -4($sp)
    sw    $ra, -4($fp)
    sw    $s0, -8($fp)
    sw    $s1, -12($fp)
    sw    $s2, -16($fp)
    addi  $sp, $sp, -20

    move  $s0, $v0
    li    $s1, 0
    li    $s2, 1

loop:
    bgt   $s2, $s0, end_loop
    add   $s1, $s1, $s2
    addi  $s2, $s2, 1
    j     loop

end_loop:
    move  $v0, $s1

    # clean the function stack

    lw    $s2, -16($fp)
    lw    $s1, -12($fp)
    lw    $s0, -8($fp)
    lw    $ra, -4($fp)
    la    $sp, 4($fp)
    lw    $fp, ($fp)

    jr    $ra
