# COMP1521 Practice Prac Exam #1
# (int dp, int n) dotProd(int *a1, int n1, int *a2, int n2)

   .text
   .globl dotProd

# params: a1=$a0, n1=$a1, a2=$a2, n2=$a3
dotProd:
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

   # add code for your dotProd function here
   
   move  $s0, $a0
   move  $s1, $a2
   
   li    $t0, 0  # i = 0
   li    $t1, 0  # sum = 0
   li    $t3, 4  # sizeof(int)

if:
   bge   $a1, $a3, else   
   move  $t2, $a1
   j loop
else:
   move  $t2, $a3
   j loop
   
   
loop:
   
   bge   $t0, $t2, end_loop
   
   li    $t4, 0
   add   $t4, $t4, $t0
   mul   $t4, $t4, $t3
   add   $t4, $t4, $s0
   lw    $t5, ($t4)
   
   li    $t4, 0
   add   $t4, $t4, $t0
   mul   $t4, $t4, $t3
   add   $t4, $t4, $s1
   lw    $t6, ($t4)
   
   mul   $t5, $t5, $t6
   add   $t1, $t1, $t5
   
   addi  $t0, $t0, 1
   j     loop
   
end_loop:
   
   move  $v0, $t1
   move  $v1, $t2

   
   

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

