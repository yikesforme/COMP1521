// BigNum.h ... LARGE positive integer values

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <ctype.h>
#include "BigNum.h"

// This is helpful function
int Isdigit(char *s);
int first_num(char *c);
int check_space(char *s, int index);

// Initialise a BigNum to N bytes, all zero
void initBigNum(BigNum *n, int Nbytes)
{
   // TODO
    
    n -> nbytes = Nbytes;
    n -> length = 0;
    n -> bytes = calloc(Nbytes,sizeof(BigNum));
    assert(n -> bytes != NULL);
    int i = 0;
    for(i = 0; i < Nbytes; i++)
    {
        n -> bytes[i] = 0;
    }
   return;
}

// Add two BigNums and store result in a third BigNum
void addBigNums(BigNum n, BigNum m, BigNum *res)
{
   // TODO
    int i = 0;
    int max_len = (n.length > m.length)?n.length:m.length;
    // initBigNum(res,max_len + 1);
    
    for (i = 0; i <= max_len; i ++)
    {
        res -> bytes[i] += n.bytes[i] + m.bytes[i];
        if (res -> bytes[i] >= 10)
        {
            res -> bytes[i] -= 10;
            res -> bytes[i+1] += 1;
           
            if (i == max_len)
            {
                res -> length += 1;
            }
        }
    }

    res -> length += max_len;
   return;
}

// Set the value of a BigNum from a string of digits
// Returns 1 if it *was* a string of digits, 0 otherwise
int scanBigNum(char *s, BigNum *n)
{
   // TODO
    // could have space
   /* if(!isdigit(*s))
        return 0;

    int len = strlen(s);
    int i = 0;
    int index = 0;
    n -> length = len - 1;
    for (i = len - 1; i >= 0; i --)
    {
        if (index >= len)
        {
            break;
        } else {
            n -> bytes[i] = s[index] - 48;
            index ++;
        }
    }*/
    
    int len = strlen(s);
    int index, i;
    index = 0;
    i = 0;
    n -> length = len - 1;
    if (Isdigit(s))
    {
        // use first_num function to get the index of first number
        index = first_num(s);
        len = len - index;
        n -> length -= index;
        
        // to check wheter there is space after number
        if (check_space(s,index))
        {
            i -= 1;
            n -> length -= 1;
        }
        for(i += len - 1; i >= 0; i --)
        {
            n -> bytes[i] = s[index] - 48;
            index ++;
        }
    } else {
        return 0;
    }
   return 1;
}

// This is for removing space
int check_space(char *s, int index)
{
    int i = index;
    while (s[i] != '\0')
    {
        if (s[i] == 32)
        {
            return 1;
        }
        i ++;
    }
    return 0;
}

// This is to check wheter it is digits
int Isdigit (char *s)
{
    int index = 0;
    while(s[index] != '\0')
    {
        if ((s[index] >= 48 && s[index] <= 57) || s[index] == 32)
        {
            index ++;
        } else {
            return 0;
        }
    }

    return 1;
}

// This is looking for the first number position
int first_num(char *c)
{
    
    int index = 0;
    while(c[index] != '\0')
    {
        
        if (c[index] == 48 || c[index] == 32)
        {
            index ++;
        } else {
            return index;
        }
    }
    return 0;
}

// Display a BigNum in decimal format
void showBigNum(BigNum n)
{
   // TODO
    int i = 0;
    for (i = n.length; i >= 0; i --)
    {
        printf("%d",n.bytes[i]);
    }
   return;
}

