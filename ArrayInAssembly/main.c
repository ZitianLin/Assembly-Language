// Name: Zitian Lin
// Date: 11/06/19


#include <stdio.h>

//compile: gcc -c -m64 -fno-pie -no-pie -o -main.o main.c


extern long control();			// extern control function that allow to call

int main()				// main function drive the program
{
	printf("%s", "----------------------------------------------\n");
	printf("%s", "This is Assignment 4 programmed by Zitian Lin\n");
	printf("%s", "Assembly is hard T A T\n");
	
	long result = control();	// call the control function and save the result

	printf("%s", "Thank you for the nice number\n");
	printf("The output number from control in decimal is: %ld \n", result);
	printf("The output number from control in hex is: %016lx\n", result);
	printf("%s", "Have a nice day.\n");

	return 0;			// end the program
}


