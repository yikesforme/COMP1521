// where_are_the_bits.c ... determine bit-field order
// COMP1521 Lab 03 Exercise
// Written by ...

#include <stdio.h>
#include <stdlib.h>

struct _bit_fields {
   unsigned int a : 1,
                b : 8,
                c : 23;
};

union test{
    int value;
    struct _bit_fields bits;
};


int main(void)
{
    /* when try to use this binary
    and use this order a,b,c
    0 10000000 01000000000000000000000
    the reslut is 1073742080
    but the reslut should be 1075838976
    so the order of bit is c,b,a
    */
    union test example;
    example.bits.a = 0;
    example.bits.b = 128;
    example.bits.c = 2097152;

    printf("%d\n",example.value);

    return 0;
}
