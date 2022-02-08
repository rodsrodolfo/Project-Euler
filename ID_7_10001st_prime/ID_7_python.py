"""What is the 10 001st prime number?"""

from math import sqrt


def isPrime(num):
    for i in range(2, int(sqrt(num))+1):
        if num % i == 0:
            return False
    return True


num = 10001
test = 3
found = 1

while found < num:
    if isPrime(test):
        found += 1
    test += 2

print(f"{num}st prime is {test - 2}")

# answer: 104743
