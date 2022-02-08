"""Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum."""


def sumSquares(num):
    return sum([i**2 for i in range(num+1)])


def squareSum(num):
    summation = sum(range(num+1))
    return summation**2


num = 100

diff = squareSum(num) - sumSquares(num)

print(f"Difference is {diff}")

# answer: 25164150
