from datetime import datetime


def factorization(num):
    factorization = {}
    factor = 2
    while num != 1:
        if num % factor == 0:
            if factor in factorization.keys():
                factorization[factor] += 1
            else:
                factorization[factor] = 1
            num /= factor
        else:
            if factor == 2:
                factor += 1
            else:
                factor += 2
    return factorization


begin = datetime.now()

num = 20

factorizationSmallest = {}

for i in range(2, num+1):
    for (factor, counter) in factorization(i).items():
        if factor in factorizationSmallest.keys():
            factorizationSmallest[factor] = max(
                factorizationSmallest[factor], counter)
        else:
            factorizationSmallest[factor] = counter

smallest = 1

for (factor, counter) in factorizationSmallest.items():
    smallest *= factor ** counter

print(datetime.now()-begin)
print(
    f"Smallest number divisible by all integers from 1 to {num} is: {smallest}")

# answer: 232792560
