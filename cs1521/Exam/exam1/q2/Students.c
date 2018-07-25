// Students.c ... implementation of Students datatype

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
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
    int ns;  // count of #students

	// Make a skeleton Students struct
	Students ss;
	if ((ss = malloc(sizeof (struct _students))) == NULL) {
		fprintf(stderr, "Can't allocate Students\n");
		return NULL;
	}

	// count how many student records
    int stu_size = sizeof(struct _stu_rec);
    sturec_t s;
	ns = 0;
    while (read(in, &s, stu_size) == stu_size) ns++;
    ss->nstu = ns;
    if ((ss->recs = malloc(ns*stu_size)) == NULL) {
		fprintf(stderr, "Can't allocate Students\n");
		free(ss);
		return NULL;
	}

	// read in the records
	lseek(in, 0L, SEEK_SET);
	for (int i = 0; i < ns; i++)
		read(in, &(ss->recs[i]), stu_size);

	close(in);
	return ss;
}

// show a list of student records pointed to by ss
void showStudents(Students ss)
{
	for (int i = 0; i < ss->nstu; i++)
		showStuRec(&(ss->recs[i]));
}

// show one student record pointed to by s
void showStuRec(StuRec s)
{
	printf("%7d %s %4d %0.1f\n", s->id, s->name, s->degree, s->wam);
}

void sortByName(Students ss)
{
	// TODO
	
	int find_index(char *str1, char *str2);
	struct _stu_rec temp;
	for (int i = 0; i < ss -> nstu; i ++)
	{
	    for (int j = 0; j < ss -> nstu; j++)
	    {
	        int num = find_index(ss -> recs[i].name, ss -> recs[j].name);
	        if (ss -> recs[i].name[num] < ss -> recs[j].name[num])
	        {
	            temp = ss -> recs[i];
	            ss -> recs[i]= ss -> recs[j];
	            ss -> recs[j] = temp;
	        }
	    }
	}
	
}

int find_index(char *str1, char *str2)
{
    int len1 = strlen(str1);
    int len2 = strlen(str2);
    
    int len;
    if (len1 >= len2)
    {
        len = len1;
    } else {
        len = len2;s
    }
    
    int i;
    for (i = 0; i < len; i++)
    {
        if (str1[i] != str2[i])
        {
            return i;
        }
    }
    
    return i;
}
