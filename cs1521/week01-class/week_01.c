#include <stdio.h>
#include <stdlib.h>


int main(int argc, char *argv[])
{
    FILE *input;
    FILE *output;
    
    char str[100];
    
    input = fopen("test.txt","r");
    output = fopen("file.txt","w");
   
   // cat1
   while( fgets (str, 50, input) != NULL ) {
        
        fputs(str,output);
   }
   
   
   // cat2
    char c;
    while ((c = fgetc(input)) != EOF) {
        fputc (c,output);
    }
    
    return 0;
}
