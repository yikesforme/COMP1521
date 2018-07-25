/*************************************************************************
	> File Name: lscpu.c
	> Author: 
	> Mail: 
	> Created Time: Thu 08 Mar 2018 09:34:53 AEDT
 ************************************************************************/

#include<stdio.h>
#include <stdio.h>

int main(int argc, char  *argv[])
{
    FILE *fp;
    char c;
    fp = fopen("/proc/cpuinfo","r");
    
    while (1)
    {
        c = fgetc(fp);
        if (feof(fp))
        {
            break;
        }
        fputc(c,stdout);
    }

    fclose(fp);
    return 0;
}
