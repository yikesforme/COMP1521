# COMP1521 18s2 Week 04 Lab
# Compute factorials, recursive function


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
# set up stack frame
    addi $sp, $sp, -8   # stack push
    sw   $a0, 4($sp)    # a0 = 4($sp) = n
    sw   $ra, 0($sp)    # ra, 0


    if:
        bgt   $a0, 1, else
        li    $v0, 1
        j     return
    else:
        addi  $a0, $a0, -1  # n - 1
        jal   fac
        lw    $t0, 4($sp)   # a0 = 4($sp) = n
        mul   $v0, $v0, $t0

    return:
        lw    $ra, 0($sp)   # resotre ra
        addi  $sp, $sp, 8   # stack pop
        jr    $ra
        
# code for fac()

## ... code for fac() goes here ...

# clean up stack frame

## ... code for epilogue goes here ...

