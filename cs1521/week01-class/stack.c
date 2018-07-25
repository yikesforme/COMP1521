/*************************************************************************
	> File Name: stack.c
	> Author: 
	> Mail: 
	> Created Time: Wed 28 Feb 2018 15:46:14 AEDT
 ************************************************************************/

#include<stdio.h>

void f();

int main()
{
    for (int i = 0; i < 10; i ++)
    {
        f();
    }

    return 0;
}

void f()
{
    static int x = 0;
    printf("%d\n",x);
    x ++;
}
