# What is the sum of the digits of the number 2^1000?

from numpy import zeros, concatenate, array, int64

def sumOfDigitsNumToPower(num, power):
    if power == 0:
        return 1
    currDigits = array([0] + [int(digit) for digit in str(num)])

    for i in range(2,power+1):
        remainder = zeros(len(currDigits), dtype=int64)

        for j in range(1,len(currDigits)):
            current = currDigits[-j] * num
            currDigits[-j] = current % 10
            remainder[-j-1] += current // 10
        
        currDigits += remainder

        if currDigits[0] != 0:
            currDigits = concatenate(([0], currDigits))

    return sum(currDigits)

print(sumOfDigitsNumToPower(2, 1000))

# answer: 1366
