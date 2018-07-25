// COMP1521 Final Exam
// Read points and determine bounding box

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

// Data type definitions

// all values are in the range 0..255
typedef unsigned char Byte;

// an (x,y) coordinate
typedef struct {
	Byte x;
	Byte y;
} Coord;

// a colour, given as 3 bytes (r,g,b)
typedef struct {
	Byte r;
	Byte g;
	Byte b;
} Color;

// a Point has a location and a colour
typedef struct {
	Coord coord;  // (x,y) location of Point
	Color color;  // colour of Point
} Point;

void boundingBox(int, Coord *, Coord *);

int main(int argc, char **argv)
{
	// check command-line arguments
	if (argc < 2) {
		fprintf(stderr, "Usage: %s PointsFile\n", argv[0]);
		exit(1);
	}

	// attempt to open specified file
	int in = open(argv[1],O_RDONLY);
	if (in < 0) {
		fprintf(stderr, "Can't read %s\n", argv[1]);
		exit(1);
	}

	// collect coordinates for bounding box
	Coord topLeft, bottomRight;
	boundingBox(in, &topLeft, &bottomRight);

	printf("TL=(%d,%d)  BR=(%d,%d)\n",
		 topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);

	// clean up
	close(in);
	return 0;
}

void boundingBox(int in, Coord *TL, Coord *BR)
{
	// TODO
	
	Point p;
	int p_size = sizeof(Point);
	
	int min_x = 999999;
	int min_y = 999999;
	int max_x = -999999;
	int max_y = -999999;
	
	while (read(in,&p,p_size) == p_size)
	{
	    if (p.coord.x < min_x)
	    {
	        min_x = p.coord.x;
	    }
	    if (p.coord.x > max_x) 
	    {
	        max_x = p.coord.x;
	    }
	    
	    if (p.coord.y < min_y)
	    {
	        min_y = p.coord.y;
	    }
	    
	    if (p.coord.y > max_y)
	    {
	        max_y = p.coord.y;
	    }
	}
	
	// if use lseek, it can be used as lseek(in,0L, SEEK_SET);
	TL -> x = min_x;
	TL -> y = max_y;
	
	BR -> x = max_x;
	BR -> y = min_y;
	
	
	
	
}
