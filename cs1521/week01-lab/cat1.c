// Copy input to output
// COMP1521 18s1

#include <stdlib.h>
#include <stdio.h>

void copy(FILE *, FILE *);

int main(int argc, char *argv[])
{
	copy(stdin,stdout);
	return EXIT_SUCCESS;
}

// Copy contents of input to output, char-by-char
// Assumes both files open in appropriate modes

void copy(FILE *input, FILE *output)
{
    char c;
    int a = 0;
    a = fscanf(input,"%c",&c);

    while (a == 1)
    {
        fprintf(output,"%c",c);
        a = fscanf(input,"%c",&c);
    }
    
}

