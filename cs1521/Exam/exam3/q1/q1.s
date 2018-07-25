# COMP1521 Practice Prac Exam #1
# int lowerfy(char *src, char *dest)

   .text
   .globl lowerfy

# params: src=$a0, dest=$a1
lowerfy:
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
    move $s1, $a1
    
    li $t0, 0 # i = 0
    li $t1, 0 # n = 0
    
    li $t2, 0
    
loop:
    li $t3, 0
    add $t3, $t3, $t0
    add $t3, $t3, $s0
    
    lb $t3, ($t3)
    
    beq $t3, $t2, end_loop
    
    li $t4, 'A'
    li $t5, 'Z'
    
    blt $t3, $t4, else
    bgt $t3, $t5, else
    
    li $t5,'a'
    sub $t5, $t5, $t4
    add $t3, $t3, $t5
    
    addi $t1, $t1, 1
    
    move $t4, $t0
    add $t4, $t4, $s1
    sb $t3, ($t4)
    addi $t0, $t0, 1
    
    j loop
else:
    move $t4, $t0
    add $t4, $t4, $s1
    sb $t3, ($t4)
    addi $t0, $t0, 1
    
    j loop
end_loop:
    
    move $t4, $t0
    add $t4, $t4, $s1
    sb $t2, ($t4)
    
    move $v0, $t1    

   # add code for your lowerfy function here

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

