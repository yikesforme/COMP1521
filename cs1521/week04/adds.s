    .data
    .text
main:
    
    add $t1, $0, $0
    lui $t1, 0x4321
    ori $t1, $t1, 0x8765

    move $a0, $t1
    li    $v0, 1
    syscall

    li    $v0, 0
    jr    $ra
