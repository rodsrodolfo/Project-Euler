"""A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc."""


def findTripletProduct(num):
    for i in range(1, num):
        for j in range(i, num):
            for k in range(j, num):
                if i + j + k == num:
                    if i**2 + j**2 == k**2:
                        return i*j*k


print(findTripletProduct(1000))

# answer: 31875000
