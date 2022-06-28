#include <iostream>
#include <cmath>
using namespace std;

bool isPrime(long num);

int main()
{
    long int num = 2000000;
    long int primeSum = 2;

    for (long int i = 3; i < num; i += 2)
    {
        if (isPrime(i))
        {
            primeSum += i;
        }
    }

    cout << "Sum of primes below " << num << " is: " << primeSum << endl;

    return 0;
}

bool isPrime(long num)
{
    bool isPrime = true;
    int i = 2;
    while (i <= sqrt(num) && isPrime)
    {
        if (num % i == 0)
        {
            isPrime = false;
        }
        i++;
    }
    return isPrime;
}

// answer: 142913828922