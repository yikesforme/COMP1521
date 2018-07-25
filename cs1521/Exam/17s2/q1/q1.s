# COMP1521 17s2 Final Exam
# void colSum(m, N, a)

   .text
   .globl colSum

# params: m=$a0, N=$a1, a=$a2
colSum:
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
   addi $sp, $sp, -4
   sw   $s2, ($sp)
   addi $sp, $sp, -4
   sw   $s3, ($sp)
   addi $sp, $sp, -4
   sw   $s4, ($sp)
   addi $sp, $sp, -4
   sw   $s5, ($sp)
   # if you need to save more than six $s? registers
   # add extra code here to save them on the stack

# suggestion for local variables (based on C code):
# m=#s0, N=$s1, a=$s2, row=$s3, col=$s4, sum=$s5

   # add code for your colSum function here
   
   move $s0, $a0  # m
   move $s1, $a1, # s1 = n
   move $s2, $a2  # a
   li   $s3, 0    # row = 0
   li   $s4, 0    # col = 0
   li   $s5, 0    # sum = 0
   
   li   $t0, 4    # int size
   li   $t1, 0
   mul  $t1, $t0, $s1   # rowsize = cols * intsize
   
loop1: 
   bge  $s4, $s1, end_loop1
   li   $s5, 0
   li   $s3, 0
loop2: 
   bge  $s3, $s1, end_loop2
   
   mul  $t2, $s3, $t1
   mul  $t3, $s4, $t0
   add  $t4, $t2, $t3
   
   add  $t4, $t4, $s0
   
   lw   $t4, ($t4)
   add  $s5, $s5, $t4
   
   addi $s3, $s3, 1
   j    loop2
   
end_loop2:
   
   li  $t4, 0
   add $t4, $t4, $s4
   mul $t4, $t4, $t0
   add $t4, $t4, $s2
   sw  $s5, ($t4)
   
   addi $s4, $s4, 1
   j   loop1

end_loop1:
   
   
# epilogue
   # if you saved more than six $s? registers
   # add extra code here to restore them
   lw   $s5, ($sp)
   addi $sp, $sp, 4
   lw   $s4, ($sp)
   addi $sp, $sp, 4
   lw   $s3, ($sp)
   addi $sp, $sp, 4
   lw   $s2, ($sp)
   addi $sp, $sp, 4
   lw   $s1, ($sp)
   addi $sp, $sp, 4
   lw   $s0, ($sp)
   addi $sp, $sp, 4
   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   j    $ra

