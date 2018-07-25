a:.word 1,3,5,7,9

main:
    li  $t0, 0
    li  $t1, 0
    li  $t2, 4

for: bge $t0, $t2, enf_for
    move $t3, $t0
    mul  $t3, $t3, 4
    add  $t1, $t1, a($t3)
    addi $t0, 1
    j for
enf_for:
    move $a0, $t1
    li   $v0, 1
    syscall
    
