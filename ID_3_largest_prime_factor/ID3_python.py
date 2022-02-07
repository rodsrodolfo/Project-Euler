"""The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?"""

from datetime import datetime


def largestPrimeFactor(num):
    largestFactor = 0
    counter = 2
    while counter**2 < num:
        if num % counter == 0:
            num /= counter
            largestFactor = counter
        else:
            if counter == 2:
                counter += 1
            else:
                counter += 2
    if num > largestFactor:
        return num

    return largestFactor


begin = datetime.now()
answer = largestPrimeFactor(600851475143)
print(datetime.now() - begin)
print(answer)
# answer: 6857
