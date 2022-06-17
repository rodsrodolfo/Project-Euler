"""What is the 10 001st prime number?"""

from math import sqrt


def isPrime(num):
    for i in range(2, int(sqrt(num))+1):
        if num % i == 0:
            return False
    return True


def nth_prime(nth):
    test = 3
    found = 1
    while found < nth:
        if isPrime(test):
            found += 1
        test += 2
    return test - 2

nth = 10001

nth_prime_found = nth_prime(nth)

print(f"{nth}st prime is {nth_prime_found}")

# answer: 104743
