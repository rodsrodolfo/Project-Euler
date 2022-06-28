#include <iostream>
#include <cmath>
using namespace std;

bool isPrime(long long num);
long long largestPrimeFactor(long long num);

int main()
{
    long long num = 600851475143;

    cout << "The largest prime factor of 600851475143 is: " <<
    largestPrimeFactor(600851475143) << endl;

    return 0;
}

bool isPrime(long long num)
{
    bool isPrime = true;
    long long i = 2;
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

long long largestPrimeFactor(long long num)
{
    long long largestPrimeFactor = 0;
    long long counter = 2;

    while (counter * counter < num)
    {
        if (num % counter == 0)
        {
            num /= counter;
            largestPrimeFactor = counter;
        }
        else
        {
            if (counter == 2)
            {
                counter += 1;
            }
            else
            {
                counter += 2;
            }
        }
    }
    if (largestPrimeFactor < num)
    {
        return num;
    }
    return largestPrimeFactor;  
}

// answer: 6857