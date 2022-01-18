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
                factor +=2
    return factorization

def numberOfDivisors(num):
    exponentsPlusOne = [(exponent + 1) for exponent in factorization(num).values()]
    numberOfDivisors = 1
    for i in exponentsPlusOne:
        numberOfDivisors *= i
    return numberOfDivisors

def smallestTriangularDivisors(num):
    last = 2
    triangular = 3

    while numberOfDivisors(triangular) < num:
        last += 1
        triangular += last

    return triangular

num = 500

print(smallestTriangularDivisors(num))

# answer: 76576500
