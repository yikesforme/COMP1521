    .data
x:  .word 4
y:  .word 5
ms: .asciiz "\n"
    .text
main:
    lw    $t0, x
    lw    $t1, y
    add   $a0, $t0, $t1
    li    $v0, 1
    syscall

    la    $a0, ms
    li    $v0, 4
    syscall

    li    $v0, 0
    jr    $ra
