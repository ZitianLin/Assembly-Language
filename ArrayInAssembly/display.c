// Name: Zitian Lin
// Date: 11/06/19

#include <stdio.h>

long display(long [], long);				// Declaration of the function

long display(long myarray[], long count)		// Define the function with two argument:
							// 1. Memory location of array 2. number of element in array
{
	printf("%s", "Hi you are in display:\n");	
	for(long i =0; i < count; i++)			// For loop runs number of elements times.
	{
		printf("%ld", *(myarray+i));		// Print the element one by one
		printf(" ");
	}
	printf("\n");			
	return 0;					// finish display, return back to control function.
}
