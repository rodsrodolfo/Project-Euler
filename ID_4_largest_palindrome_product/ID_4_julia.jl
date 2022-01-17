#= A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers. =#

largestPalindrome = 0

for i in 1:1000, j in 1:1000
    num = i * j
    if string(num) == reverse(string(num)) && largestPalindrome < num
        global largestPalindrome = num
    end
end

print(largestPalindrome)

# answer: 906609