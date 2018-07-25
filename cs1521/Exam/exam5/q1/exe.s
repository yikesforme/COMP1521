# COMP1521 Practice Prac Exam #1
# arrays

   .data

a1:
   .word   1   # deliberate
a1N:
   .word   0   # int a1N = 0
a2:
   .word   1, 1, 2, 3, 5, 8, 13
a2N:
   .word   7    # int a2N = 7

   .align  2
# COMP1521 Practice Prac Exam #1
# main program + show function

   .data
m1:
   .asciiz "a1 = "
m2:
   .asciiz "a2 = "
m3:
   .asciiz "dP = "
   .align  2

   .text
   .globl main
main:
   addi $sp, $sp, -4
   sw   $fp, ($sp)
   la   $fp, ($sp)
   addi $sp, $sp, -4
   sw   $ra, ($sp)

   la   $a0, a1
   lw   $a1, a1N
   la   $a2, a2
   lw   $a3, a2N
   jal  dotProd      # (dp,n) = dotProd(a1, a1N, a2, a2N)

   move $s0, $v0
   move $s1, $v1

   la   $a0, m1
   li   $v0, 4
   syscall           # printf("a1 = ")
   la   $a0, a1
   lw   $a1, a1N
   jal  showArray    # showArray(a1, a1N)

   la   $a0, m2
   li   $v0, 4
   syscall           # printf("a2 = ")
   la   $a0, a2
   lw   $a1, a2N
   jal  showArray    # showArray(a2, a2N)

   la   $a0, m3
   li   $v0, 4
   syscall           # printf("dP = ")
   move $a0, $s0
   move $a1, $s1
   jal  showPair     # showPair(dp,n)

   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   j    $ra

# showArray(int *a, int n)
# params: a=$a0, n=$a1
# locals: a=$s0, n=$s1, i=$s2
showArray:
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

   move $s0, $a0
   move $s1, $a1
   li   $s2, 0            # i = 0
show_for:
   bge  $s2, $s1, end_show_for

   move $t0, $s2
   mul  $t0, $t0, 4
   add  $t0, $t0, $s0
   lw   $a0, ($t0)
   li   $v0, 1            # printf("%d",a[i])
   syscall

   move $t0, $s2
   addi $t0, $t0, 1
   bge  $t0, $s1, incr_show_for
   li   $a0, ','
   li   $v0, 11           # printf(",")
   syscall

incr_show_for:
   addi $s2, $s2, 1       # i++
   j    show_for

end_show_for:
   li   $a0, '\n'
   li   $v0, 11
   syscall

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

# showPair(int dp, int n)
# params: dp=$a0, n=$a1
# locals: a=$s0, n=$s1, i=$s2
showPair:
   addi $sp, $sp, -4
   sw   $fp, ($sp)
   la   $fp, ($sp)
   addi $sp, $sp, -4
   sw   $ra, ($sp)
   addi $sp, $sp, -4
   sw   $s0, ($sp)
   addi $sp, $sp, -4
   sw   $s1, ($sp)

   move $s0, $a0
   move $s1, $a1

   li   $a0, '('
   li   $v0, 11
   syscall

   move $a0, $s0
   li   $v0, 1
   syscall

   li   $a0, ','
   li   $v0, 11
   syscall

   move $a0, $s1
   li   $v0, 1
   syscall

   li   $a0, ')'
   li   $v0, 11
   syscall
   li   $a0, '\n'
   li   $v0, 11
   syscall

   lw   $s1, ($sp)
   addi $sp, $sp, 4
   lw   $s0, ($sp)
   addi $sp, $sp, 4
   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   j    $ra
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

