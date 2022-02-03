#= A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers. =#

function isPalindrome(num::Int64)::Bool
    st = string(num)
    st == reverse(st) && return true
    return false
end

function findLargestPalindormeProductDigits(power::Int64)
    largest = 0
    for i in 1:10^power, j in 1:10^power
        possible = i*j
        possible > largest && isPalindrome(possible) && (largest = possible)
    end
    return largest
end

const NUM = 3
println(@time findLargestPalindormeProductDigits(NUM))

# answer: 906609
