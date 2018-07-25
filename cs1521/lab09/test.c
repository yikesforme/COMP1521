#include <stdio.h>

typedef struct _node
{
    int value;
    struct _node *next;
} Node;

int main()
{
    printf("size: %d\n", sizeof(Node));
}
