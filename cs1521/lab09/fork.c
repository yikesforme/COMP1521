#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int main(void)
{
    pid_t pid; 
    int i = 0;
    while(i < 4)
    {
        if (pid = fork() != 0)
        {
            printf("I am parent: %d\n",pid);
            i ++;
        } else {
            printf("I am child: %d\n", pid);
            i += 2;
        }
    }
    
    return 0;
}
