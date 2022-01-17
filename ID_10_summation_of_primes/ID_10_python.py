"""The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million."""

from math import sqrt

def isPrime(num):
    for i in range(2, int(sqrt(num))+1):
        if num % i == 0:
            return False
    return True

num = 2000000

primeSum = 2

for i in range(3, num, 2):
    if isPrime(i):
        primeSum += i

print(f"Sum of primes below {num} is: {primeSum}")

# answer: 142913828922
