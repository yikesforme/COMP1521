/*************************************************************************
	> File Name: string.c
	> Author: 
	> Mail: 
	> Created Time: Wed 28 Feb 2018 15:21:54 AEDT
 ************************************************************************/

#include<stdio.h>

int main()
{
    char *str = "abc123\n";
    char *c;

    for (c = str; *c != '\0'; c++)
    {
        putchar(*c);
    }
    return 0;
}
