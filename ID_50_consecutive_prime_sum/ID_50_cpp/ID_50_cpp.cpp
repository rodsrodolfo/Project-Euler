#include <cmath>
#include <iostream>
#include <vector>
using namespace std;

int numValue(int argc, char* argv[]) {
    if (argc == 2) {
        return strtol(argv[1], nullptr, 0);
    }
    return 1000000;
}

bool isPrime(int num) {
    for (int i = 2; i <= sqrt(num) + 1; i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

int sumVector(int begin, int end, vector<int> curr_vector) {
    int sum{};

    for (int i = begin; i <= end; i++) {
        sum += curr_vector.at(i);
    }
    return sum;
}

int nextPrime(int prime) {
    int next_prime{prime + 1};

    while (!isPrime(next_prime)) {
        next_prime += 1;
    }
    return next_prime;
}

// void pushNextPrime(vector<int> curr_vector) {
//     const int size{curr_vector.size()};
//     const int next_prime{nextPrime(curr_vector.back())};

//     curr_vector.push_back(next_prime);
// }

vector<int> buildPrimeVector(int max_sum) {
    vector<int> prime_vector{2};
    int next_prime{nextPrime(prime_vector.back())};

    while (prime_vector.back() + next_prime < max_sum) {
        prime_vector.push_back(next_prime);
        next_prime = nextPrime(next_prime);
    }
    return prime_vector;
}

int findPrimeSum(vector<int> prime_vector, int sum_length) {
    int possible_sequences{prime_vector.size() - sum_length + 1};
    int curr_sum{};

    for (int i = 0; i < possible_sequences; i++) {
        curr_sum = sumVector(i, i + sum_length - 1, prime_vector);
        if (isPrime(curr_sum)) {
            return curr_sum;
        }
    }
    return curr_sum;
}

int maxLength(int num, vector<int> prime_vector) {
    for (int i = 0; i < prime_vector.size(); i++) {
        if (sumVector(0, i, prime_vector) >= num) {
            return i - 1;
        }
    }
    return prime_vector.size();
}

int main(int argc, char* argv[]) {
    const int NUM{numValue(argc, argv)};
    const vector<int> prime_vector{buildPrimeVector(NUM)};
    int found_prime{};

    for (int i = maxLength(NUM, prime_vector); i > 0; i--) {
        found_prime = findPrimeSum(prime_vector, i);
        if (found_prime != 0) {
            cout << "Prime: " << found_prime << endl;
            cout << "Length: " << i << endl;
            return 0;
        }
    }

    return 0;
}