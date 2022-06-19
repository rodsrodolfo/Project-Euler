#include <cmath>
#include <iostream>
#include <stdlib.h>
using namespace std;

bool isPrime(const int num) {
    for (int i{2}; i <= sqrt(num) + 1; i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

long int primeSumBelow(const int num) {
    long int totalSum{2};
    for (int i{3}; i < num; i += 2) {
        if (isPrime(i)) {
            totalSum += i;
        }
    }
    return totalSum;
}

int NUM_value(int argc, char* argv[]){
    if (argc==2)
    {
        return strtol(argv[1], nullptr, 0);
    }
    return 2000000;
}

int main(int argc, char* argv[]) {
    const int NUM{NUM_value(argc, argv)};
    long int result{};

    result = primeSumBelow(NUM);

    cout << "Sum of primes below " << NUM << " is: " << result << endl;

    return 0;
}

// answer: 142913828922