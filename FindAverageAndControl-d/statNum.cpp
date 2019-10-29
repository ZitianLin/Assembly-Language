// CPSC 240
// Asignment 3
// Name: Zitian Lin
// CWID: 887785608

#include <stdio.h>

extern "C" long stat();

int main()
{
	printf("Welcome to Statistical Numbers\n");
	printf("Created by Zitian Lin\n");

	long num = stat();

	printf("This is the C++ program responding. ");
	printf("Here we received the number %ld, have a nice day.\n", num);
	return 0;
}


