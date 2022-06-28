#include <cmath>
#include <iostream>
using namespace std;

bool isPrime(int num) {
    for (int i = 2; i <= sqrt(num) + 1; i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

int nth_prime(int nth) {
    int test{3};
    int found{1};
    while (found < nth) {
        if (isPrime(test)) {
            found++;
        }
        test += 2;
    }
    return test - 2;
}

int main() {
    const int nth{10001};

    cout << "The " << nth << "th prime is: " << nth_prime(nth) << endl;

    return 0;
}