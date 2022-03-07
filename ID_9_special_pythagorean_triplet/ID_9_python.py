"""A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc."""

from datetime import datetime
from math import sqrt

def findTripletProduct(num):
    for i in range(1, num):
        for j in range(i+1, num):
            k = sqrt(i**2+j**2)
            if i+j+k==num:
                return int(i*j*k)

start = datetime.now()

result = findTripletProduct(1000)

deltatime = datetime.now() - start

print(f"sum = {result}")
print(f"time = {deltatime}")

# answer: 31875000
# 0:00:00.074684
