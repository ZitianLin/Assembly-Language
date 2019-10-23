// Name: Zitian Lin
// 10/23/2019

#include <stdio.h>

extern "C" long arithmetic();

int main()
{
  printf("Welcome to Open source Assembly Programming\n");
  					// call the arithmetic function
  long result = arithmetic();		// save the return value into result

  printf("The main function received this number: ");
  printf("%ld\n",result);		// print out the result.
  printf("Main will now return 0 to the operating system\n");
  printf("Good-bye\n");
  return 0;

}
