"""A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers."""

largestPalindrome = 0

for i in range(1000):
    for j in range(1000):
        num = i * j
        if str(num) == str(num)[::-1]:
            if largestPalindrome < num:
                largestPalindrome = num

print(largestPalindrome)

# answer: 906609