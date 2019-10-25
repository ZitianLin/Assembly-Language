// Name:Zitian Lin
// 10/24/19


#include <stdio.h>

//compile: gcc -c -m64 -fno-pie -no-pie -o div.o division.c



extern long division();

int main()
{
	printf("%s", "This is Assignment 2 programmed by Zitian Lin\n");		printf("I like this open source programming.\n");
	long result = division();		//hold the return value.

	printf("\nThe main driver received this number: %ld\n", result);
	printf("Next the main will return 0 to the operating system. Bye\n");
	return 0;
		
}
