"""The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million."""

from datetime import datetime
from math import sqrt


def isPrime(num):
    for i in range(2, int(sqrt(num))+1):
        if num % i == 0:
            return False
    return True


start = datetime.now()

result = sum(filter(isPrime, range(3, 2000000, 2))) + 2

deltatime = datetime.now() - start

print(f"sum = {result}")
print(f"time = {deltatime}")

# answer: 142913828922
# 0:00:06.419969
