#include <iostream>
#include <cmath>
using namespace std;

bool isPrime(int num);
int findTripletProduct(int num);

int main()
{
    int num = 1000;

    cout << findTripletProduct(num) << endl;

    return 0;
}

bool isPrime(int num)
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

int findTripletProduct(int num)
{
    for (int i = 1; i < num; i++)
    {
        for (int j = i; j < num; j++)
        {
            for (int k = j; k < num; k++)
            {
                if (i + j + k == num)
                {
                    if (i * i + j * j == k * k)
                    {
                        return i * j * k;
                    }
                }
            }
        }
    }
    return 0;
}