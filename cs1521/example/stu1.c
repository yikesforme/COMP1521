#include <stdio.h>

int main()
{
    FILE *in;
    in = fopen("Student1", "r");
    char buf[256];
    
    while(fgets(buf, 256, in) != NULL)
    {
        sscanf(buf, "%s", &stu.name);
    }
}
