"""A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers."""

from datetime import datetime

largestPalindrome = 0

begin = datetime.now()

for i in range(1000):
    for j in range(1000):
        num = i * j
        if str(num) == str(num)[::-1]:
            if largestPalindrome < num:
                largestPalindrome = num

print(datetime.now() - begin)
print(largestPalindrome)

# answer: 906609