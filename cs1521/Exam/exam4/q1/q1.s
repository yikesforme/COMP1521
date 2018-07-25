# COMP1521 Practice Prac Exam #1
# int novowels(char *src, char *dest)

   .text
   .globl novowels

# params: src=$a0, dest=$a1
novowels:
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

   # add code for your novwels function here
   move $s0, $a0    # s0 = src
   move $s1, $a1    # s1 = dest
   
   li   $t6, 0 # i=0
   li   $t1, 0 # j=0
   li   $t2, 0 # n=0
   li   $t3, 0 # sizeof(char)   
loop:
   li   $t4, 0
   add  $t4, $t4, $t6
   add  $t4, $t4, $s0
   lb   $t4, ($t4)
   
   beq  $t4, $t3, end_loop
   
   move $a0, $t4
   jal  isvowel
   
   bne  $v0, 1, else
   
   addi $t2, $t2, 1
   addi $t6, $t6, 1
   j    loop
   
else:
   li   $t5, 0
   add  $t5, $t5, $t1
   add  $t5, $t5, $s1
   sb   $t4, ($t5)
   
   addi $t6, $t6, 1
   addi $t1, $t1, 1
   j    loop
   
end_loop:
    
   li   $t5, 0
   add  $t5, $t5, $t1
   add  $t5, $t5, $s1
   li   $t4, 0
   sb   $t4, ($t5)
   
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

#####

# auxiliary function
# int isvowel(char ch)
isvowel:
# prologue
   addi $sp, $sp, -4
   sw   $fp, ($sp)
   la   $fp, ($sp)
   addi $sp, $sp, -4
   sw   $ra, ($sp)

# function body
   li   $t0, 'a'
   beq  $a0, $t0, match
   li   $t0, 'A'
   beq  $a0, $t0, match
   li   $t0, 'e'
   beq  $a0, $t0, match
   li   $t0, 'E'
   beq  $a0, $t0, match
   li   $t0, 'i'
   beq  $a0, $t0, match
   li   $t0, 'I'
   beq  $a0, $t0, match
   li   $t0, 'o'
   beq  $a0, $t0, match
   li   $t0, 'O'
   beq  $a0, $t0, match
   li   $t0, 'u'
   beq  $a0, $t0, match
   li   $t0, 'U'
   beq  $a0, $t0, match

   li   $v0, 0
   j    end_isvowel
match:
   li   $v0, 1
end_isvowel:

# epilogue
   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   j    $ra
