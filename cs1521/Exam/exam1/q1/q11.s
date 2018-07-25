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
    
   move $s0, $a0
   move $s1, $a2
   
   li $t0, 0
   li $t5, 0
   li $t1, 4
loop:
   bge $t0, $a1, end_loop
   
   mul $t2, $t0, $t1
   add $t2, $t2, $s0
   lw $t2, ($t2)
   
   rem $t3, $t2, 2
   
   bne $t3, 0, else
   
   mul $t4, $t1, $t5
   add $t4, $t4, $s1
   sw $t2, ($t4)
   
   addi $t0, $t0, 1
   addi $t5, $t5, 1
   j loop
   
else:
   addi $t0, $t0, 1
   j loop

end_loop:

    move $v0, $t5
    
   
   
   # add code for your rmOdd function here

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

