# COMP1521 Practice Prac Exam #1
# int everyKth(int *src, int n, int k, int*dest)

   .text
   .globl everyKth

# params: src=$a0, n=$a1, k=$a2, dest=$a3
everyKth:
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
    move $s1, $a3
    
    li $t0, 0 # i = 0
    li $t1, 0 # j = 0
    li $t2, 4 # sizeof(int)
loop:
    
    bge $t0, $a1, end_loop
    
    rem $t4, $t0, $a2
    bne $t4, 0, else
    
    mul $t3, $t0, $t2
    add $t3, $t3, $s0
    
    lw $t3, ($t3)
    
    mul $t5, $t1, $t2
    add $t5, $t5, $s1
    
    sw $t3, ($t5)
    
    addi $t1, $t1, 1
    addi $t0, $t0, 1
    j loop
else:
    
    addi $t0, $t0, 1
    j loop
    
end_loop:
    move $v0, $t1
    
    
    
   # add code for your everyKth function here

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

