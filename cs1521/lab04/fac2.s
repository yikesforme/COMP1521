# COMP1521 18s2 Week 04 Lab
# Compute factorials, iterative function


### Global data

   .data
msg1:
   .asciiz "n  = "
msg2:
   .asciiz "n! = "
eol:
   .asciiz "\n"

### main() function
   .text
   .globl main
main:
   #  set up stack frame
   sw    $fp, -4($sp)       # push $fp onto stack
   la    $fp, -4($sp)       # set up $fp for this function
   sw    $ra, -4($fp)       # save return address
   sw    $s0, -8($fp)       # save $s0 to use as ... int n;
   addi  $sp, $sp, -12      # reset $sp to last pushed item

   #  code for main()
   li    $s0, 0             # n = 0;

   la    $a0, msg1
   li    $v0, 4
   syscall                  # printf("n  = ");


   li    $v0, 5
   syscall

   move  $s0, $v0
   move  $a0, $s0
   jal   fac
   move  $s0, $v0

   la    $a0, msg2
   li    $v0, 4
   syscall

   move  $a0, $s0
   li    $v0, 1
   syscall

## ... rest of code for main() goes here ...

   la    $a0, eol
   li    $v0, 4
   syscall                  # printf("\n");

   # clean up stack frame
   lw    $s0, -8($fp)       # restore $s0 value
   lw    $ra, -4($fp)       # restore $ra for return
   la    $sp, 4($fp)        # restore $sp (remove stack frame)
   lw    $fp, ($fp)          # restore $fp (remove stack frame)

   li    $v0, 0
   jr    $ra                # return 0

# fac() function

fac:
# setup stack frame
    sw    $fp, -4($sp)      # push $fp
    la    $fp, -4($sp)      # reset $fp
    sw    $ra, -4($fp)      # push $ra
    sw    $s0, -8($fp)      # push $ra
    addi  $sp, $sp, -12
## ... code for prologue goes here ...

  li $s1, 1
  li $s2, 1

## ... code for fac() goes here ...

while:
    bgt $s1, $a0, end_while
    mul $s2, $s2, $s1
    addi $s1, $s1, 1
    j while
end_while:
  move $v0, $s2
  
# epilogue
   lw    $s0, -8($fp)     # $s0 = pop
   lw    $ra, -4($fp)     # $ra = pop
   lw    $fp, ($fp)       # $fp = pop
   addi  $sp, $sp, 12
   
   jr    $ra
