/*************************************************************************
	> File Name: pointer.c
	> Author: 
	> Mail: 
	> Created Time: Wed 28 Feb 2018 15:03:39 AEDT
 ************************************************************************/

#include<stdio.h>

int main()
{
    int n = 1234;
    int *p;
    p = &n;
    n ++;
    printf("%d\n",n);
    printf("%p\n", &n);
    printf("%p\n",p);
    p++;
    printf("%p\n",p);
    printf("%d\n",*p);
}
