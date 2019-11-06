// Name: Zitian Lin
// Date: 11/06/19

#include <iostream>
#include <array>

using namespace std;

extern "C" long fill(long [], long);					// Declaration of the function

long fill(long myarray[], long maxNumber)				// Fill function body with two argument
{
	
	cout << "\nPlease enter integers to put into array:(press Control-D when finished)" << endl;	
	cin.clear();							// Clear the error in the input if second time
									// access to the function
	int i = 0;							// Index for the array
	while(cin >> myarray[i])					// put the integer into array
	{
		i++;							// move to the next avaliable space
	}
	return i;						// Return number of element in the array.
}
