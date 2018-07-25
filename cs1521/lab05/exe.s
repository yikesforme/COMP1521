# COMP1521 18s2 Week 05 Lab
#
# Matrix data #8

   .data
N: .word  8
M: .word  4
P: .word  8
A: .word  1, 2, 3, 4
   .word  1, 2, 4, 3
   .word  1, 3, 2, 4
   .word  1, 3, 4, 2
   .word  2, 1, 3, 4
   .word  2, 1, 4, 3
   .word  2, 3, 1, 4
   .word  2, 3, 4, 1
B: .word  1, 2, 3, 4, 4, 3, 2, 1
   .word  2, 3, 4, 1, 1, 4, 3, 2
   .word  3, 4, 1, 2, 2, 1, 4, 3
   .word  4, 1, 2, 3, 3, 2, 1, 4
C: .space 256

# COMP1521 18s1 Week 05 Lab
#
# Main program to drive matrix multiplication
# Assumes that labels N,M,P,A,B,C exist, and
# refer to appropriate objects/values
   .data
labelA:
   .asciiz "A:\n"
labelB:
   .asciiz "\nB:\n"
labelC:
   .asciiz "\nC:\n"

   .text
   .globl main
main:
   # set up stack frame for main()
   sw   $fp, -4($sp)
   la   $fp, -4($sp)
   sw   $ra, -4($fp)
   addi $sp, $sp, -8

   # print matrix A
   la   $a0, labelA
   li   $v0, 4
   syscall
   lw   $a0, N
   lw   $a1, M
   la   $a2, A
   jal  printMatrix

   # print matrix B
   la   $a0, labelB
   li   $v0, 4
   syscall
   lw   $a0, M
   lw   $a1, P
   la   $a2, B
   jal  printMatrix

   # multiply C = A x B
   lw   $a0, N             # matrix dimensions in $a?
   lw   $a1, M
   lw   $a2, P
   addi $sp, $sp, -4       # matrix addresses on stack
   la   $t0, A
   sw   $t0, ($sp)         # push(&A)
   addi $sp, $sp, -4
   la   $t0, B
   sw   $t0, ($sp)         # push(&B)
   addi $sp, $sp, -4
   la   $t0, C
   sw   $t0, ($sp)         # push(&C)
   jal  multMatrices
   nop
   addi $sp, $sp, 12       # clean args off stack

   # print matrix C
   la   $a0, labelC
   li   $v0, 4
   syscall
   lw   $a0, N
   lw   $a1, P
   la   $a2, C
   jal  printMatrix

   # return 0 and clean up stack
   li   $v0, 0
   lw   $ra, -4($fp)
   la   $sp, 4($fp)
   lw   $fp, ($fp)
   jr   $ra

# COMP1521 18s1 Week 05 Lab
#
# void printMatrix(int nrows, int ncols, int m[nrows][ncols])
# {
#    for (int r = 0; r < nrows; r++) {
#       for (int c = 0; c < ncols; c++) {
#          printf(" %3d", m[r][c]);
#       }
#       printf("\n");
#    }
# }

   .text
   .globl printMatrix
printMatrix:
   # register usage:
   # nrows is $s0, ncols is $s1, r is $s2, c is $s3

   # set up stack frame for printMatrix()
   sw   $fp, -4($sp)
   la   $fp, -4($sp)
   sw   $ra, -4($fp)
   sw   $s0, -8($fp)
   sw   $s1, -12($fp)
   sw   $s2, -16($fp)
   sw   $s3, -20($fp)
   addi $sp, $sp, -24

   # set up registers
   move $s0, $a0
   move $s1, $a1
   
   # for r in 0..nrows-1
   li   $s2, 0
print_loop1:
   bge  $s2, $s0, print_end1
   # for c in 0..ncols-1
   li   $s3, 0
print_loop2:
   bge  $s3, $s1, print_end2
   # get m[r][c]
   li   $t1, 4            # sizeof(int)
   mul  $t0, $s2, $s1
   mul  $t0, $t0, $t1     # offset of start of row r
   mul  $t1, $s3, $t1     # offset of col c within row
   add  $t0, $t0, $t1     # offset from start of matrix
   add  $t0, $t0, $a2
   lw   $a0, ($t0)        # a0 = m[r][c]
   li   $v0, 1
   syscall                # printf("%d", a0)
   li   $a0, ' '
   li   $v0, 11
   syscall                # putchar(' ')
   addi $s3, $s3, 1       # c++
   j    print_loop2
print_end2:
   li   $a0, '\n'         # putchar('\n')
   li   $v0, 11
   syscall
   addi $s2, $s2, 1       # r++
   j    print_loop1
print_end1:

   # clean up stack and return
   lw   $ra, -4($fp)
   lw   $s0, -8($fp)
   lw   $s1, -12($fp)
   lw   $s2, -16($fp)
   lw   $s3, -20($fp)
   la   $sp, 4($fp)
   lw   $fp, ($fp)
   jr   $ra

# COMP1521 18s1 Week 05 Lab
#
# void multMatrices(int n, int m, int p,
#                   int A[n][m], int B[m][p], int C[n][p])
# {
#    for (int r = 0; r < n; r++) {
#       for (int c = 0; c < p; c++) {
#          int sum = 0;
#          for (int i = 0; i < m; i++) {
#             sum += A[r][i] * B[i][c];
#          }
#          C[r][c] = sum;
#       }
#    }
# }

   .text
   .globl multMatrices
multMatrices:
   # possible register usage:
   # n is $s0, m is $s1, p is $s2,
   # r is $s3, c is $s4, i is $s5, sum is $s6

   # set up stack frame for multMatrices()
   
   sw    $fp, -4($sp)
   la    $fp, -4($sp)
   sw    $ra, -4($fp)
   sw    $s0, -8($fp)        # n is $s0
   sw    $s1, -12($fp)       # m is $s1
   sw    $s2, -16($fp)       # p is $s2
   sw    $s3, -20($fp)       # r is $s3
   sw    $s4, -24($fp)       # c is $s4
   sw    $s5, -28($fp)       # i is $s5
   sw    $s6, -32($fp)       # sum is $s6
   addi  $sp, $sp, -36

   # get the value from n, m, p
   move  $s0, $a0
   move  $s1, $a1
   move  $s2, $a2
   # implement above C code
   
   # lw    $t0, 12($fp)        # matrix A is t0
   # lw    $t1, 8($fp)         # matrix B is t1
   # lw    $t2, 4($fp)         # matrix C is t2
   
   li    $s3, 0              # r = 0
   li    $s7, 4              # int size is 4


   # this is loop part
loop1:
    # r = 0, r < n ($s0)
    bge  $s3, $s0, end_loop1
    li   $s4, 0
loop2:
    # c = 0, c < p ($s2)
    bge  $s4, $s2, end_loop2
    li   $s6, 0              # sum = 0
    li   $s5, 0              # i = 0
loop3:
    # i = 0, i < m ($s1)
    bge  $s5, $s1, end_loop3
    
    # first get matrix A[r][i]
    mul  $t0, $s1, $s7       # rowsize = cols(m) * int(size)
    mul  $t1, $s3, $t0       # row(r) * rowsize
    mul  $t2, $s5, $s7       # col(i) * int(size)
    add  $t1, $t1, $t2       # offset = t1 + t2
    lw   $t3, A($t1)         # t3 = A + (offset)

    #get the matrix B[i][c]
    
    mul  $t0, $s2, $s7       # rowsize = col(p) * int(size)
    mul  $t1, $s5, $t0       # t1 = row(i) * rowsize
    mul  $t2, $s4, $s7       # t2 = col(c) * int(size)
    add  $t1, $t1, $t2       # offset = t1 + t2
    lw   $t4, B($t1)         # t4 = (B + offset)

    mul  $t3, $t3, $t4       # t3 = t3 * t4
    add  $s6, $s6, $t3       # sum = sum + A[r][i] * B[i][c] 
    addi $s5, $s5, 1         # i ++

    j    loop3

end_loop3:

    mul  $t0, $s2, $s7       # rowsize = col(p) * int(size)
    mul  $t1, $s3, $t0       # t1 = row(r) * rowsize
    mul  $t2, $s4, $s7       # t2 = col * int(size)
    add  $t1, $t1, $t2       # offset = t1 + t2
    sw   $s6  C($t1)         # c[r][c] = sum($s6)

    addi $s4, $s4, 1         # c ++
    j    loop2
end_loop2:
    addi $s3, $s3, 1         # r ++ 
    j    loop1
end_loop1:
   # clean up stack and return

   lw    $ra, -4($fp)
   lw    $s0, -8($fp)
   lw    $s1, -12($fp)
   lw    $s2, -16($fp)
   lw    $s3, -20($fp)
   lw    $s4, -24($fp)
   lw    $s5, -28($fp)
   lw    $s6, -32($fp)
   la    $sp, 4($fp)
   lw    $fp, ($fp)
   jr    $ra
