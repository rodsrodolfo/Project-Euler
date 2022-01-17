#include <iostream>
using namespace std;

int main() {
    int multipleSum = 0;

    for (int i = 0; i < 1000; i++)
    {
        if (i % 3 == 0 || i % 5 == 0)
        {
            multipleSum += i;
        }
        
    }
    
    cout << "The sum of all multiples of 3 and 5 below 1000 is: " 
    << multipleSum << endl;

    return 0;
}

// answer: 233168