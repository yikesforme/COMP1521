// Students.c ... implementation of Students datatype

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <assert.h>
#include "Students.h"

typedef struct _stu_rec {
	int   id;
	char  name[20];
	int   degree;
	float wam;
} sturec_t;

typedef struct _students {
    int    nstu;
    StuRec recs;
} students_t;

// build a collection of student records from a file descriptor
Students getStudents(int in)
{
    // printf("set: %d\n", SEEK_SET);
    
    Students s = calloc(1, sizeof(struct _students));
    s -> nstu = 0;
    if (s == NULL)
    {
        perror("Calloc error");
        return NULL;
    }
    
    int stu_size = sizeof(struct _stu_rec);
    sturec_t stu;
    
    // must use while to read number
    while (read(in,&stu,stu_size) == stu_size)
        s -> nstu ++;
        
    s -> recs = calloc(s -> nstu, sizeof(struct _stu_rec));
    
    lseek(in, 0L, SEEK_SET);
    for (int i = 0; i < s -> nstu; i++)
    {
        read(in, &(s->recs[i]), stu_size);
    }
    
    close(in);
	return s;  // TODO ... replace this by your code
}

// show a list of student records pointed to by ss
void showStudents(Students ss)
{
	assert(ss != NULL);
	for (int i = 0; i < ss->nstu; i++)
		showStuRec(&(ss->recs[i]));
}

// show one student record pointed to by s
void showStuRec(StuRec s)
{
	printf("%7d %s %4d %0.1f\n", s->id, s->name, s->degree, s->wam);
}
