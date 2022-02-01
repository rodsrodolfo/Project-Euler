from math import sqrt

def isPrime(num):
    if num < 2:
        return False
    for i in range(2, int(sqrt(num))+1):
        if num % i == 0:
            return False
    return True

def quadratic(n, a, b):
    return n**2 + a*n + b

def consecutivePrimes(a, b):
    count = 0
    tryNum = 0
    while True:
        currResult = quadratic(tryNum, a, b)
        if not isPrime(currResult):
            return count
        count += 1
        tryNum += 1

def longestConsecutivePrimes(modA, modB):
    longest = (0,0,0)
    for a in range(-modA,modA+1):
        for b in range(-modB, modB+1):
            consecutive = consecutivePrimes(a, b)
            if longest[0] < consecutive:
                longest = (consecutive, a, b)
    return longest

A, B = 999, 1000

from datetime import datetime
begin_time = datetime.now()
size, a, b = longestConsecutivePrimes(A,B)
print(datetime.now() - begin_time)

print(f"size: {size}\na: {a}\nb: {b}\na*b: {a*b}")
