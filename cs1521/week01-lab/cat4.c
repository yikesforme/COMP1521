// Copy input to output
// COMP1521 18s1

#include <stdlib.h>
#include <stdio.h>

void copy(FILE *, FILE *);

int main(int argc, char *argv[])
{
    FILE *fp;
    
    // if there no file name just get info from keyboard
	if(argc == 1)
    {
        // stdin is a function that put info from computer
        // stdout is print on computer
        copy(stdin,stdout);
    } else {
        for (int i = 1; i < argc; i ++)
        {
            // if cannot open this files, anaylize argv++
            // fp is used to open this files
            if ((fp = fopen(argv[i],"r")) == NULL)
            {
                printf("Can't read NameOfFile\n");
                return 1;
            } else {
                copy(fp,stdout);
                fclose(fp);
            }
        }
    }
	return EXIT_SUCCESS;
}

// Copy contents of input to output, char-by-charc
// Assumes both files open in appropriate mode

void copy(FILE *input, FILE *output)
{

    char str[2048];
    while (fgets(str,2048,input) != NULL)
    {
        fputs(str,output);
    }
}
