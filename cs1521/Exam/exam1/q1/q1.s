# COMP1521 Practice Prac Exam #1
# int rmOdd(int *src, int n, int*dest)

   .text
   .globl rmOdd

# params: src=$a0, n=$a1, dest=$a2
rmOdd:
# prologue
   addi $sp, $sp, -4
   sw   $fp, ($sp)
   la   $fp, ($sp)
   addi $sp, $sp, -4
   sw   $ra, ($sp)
   addi $sp, $sp, -4
   sw   $s0, ($sp)
   addi $sp, $sp, -4
   sw   $s1, ($sp)
   # if you need to save more $s? registers
   # add the code to save them here

# function body
# locals: ...

# int rmOdd(int *src, int n, int *dest)
# {
#    int i, j = 0;
#    for (i = 0; i < n; i++) {
#       if (src[i]%2 == 0) {
#          dest[j] = src[i];
#          j++;
#       }
#    }
#    return j;
# }
    move $t6, $a0   # *src
    move $t7, $a2   # *dest
    
    li  $t0, 4      # int_size = 4
    li  $t1, 0      # i = 0
    li  $t2, 0      # j = 0
    move $t3, $a1   # $t3 = n

rm_loop:
    bge $t1, $t3, rm_endfor
rm_if:
    mul $t4, $t1, $t0
    add $t4, $t4, $t6
    lw  $t4, ($t4)
    li  $t8, 2
    rem $t5, $t4, $t8
    
    bne $t5, 0, rm_endif
    
    ##########################################
    #
    # old: add $t7, $t5, $t7
    # cheng bei zeng jia
    # ying gai shi 4 byte lai zeng jia 
    #
    mul $t5, $t2, $t0
    add $t5, $t5, $t7
    sw  $t4, ($t5)
    
    addi $t2, $t2, 1    # j++
rm_endif:
    addi $t1, $t1, 1    # i++
    j   rm_loop
rm_endfor:
    move $v0, $t2

# epilogue
   # if you saved more than two $s? registers
   # add the code to restore them here
   lw   $s1, ($sp)
   addi $sp, $sp, 4
   lw   $s0, ($sp)
   addi $sp, $sp, 4
   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   j    $ra
