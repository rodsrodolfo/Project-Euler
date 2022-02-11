function isPalindrome(num::String)::Bool
    num == reverse(num) && return true
    return false
end

function isPalindrome(num::Int64)::Bool
    st = string(num)
    return isPalindrome(st)
end

function base10to2(num::Int64)::String
    base2 = ""
    curr = num
    while curr != 0
        base2 = string(curr % 2) * base2
        curr ÷= 2
    end
    return base2
end

function isPalindromeBases(num::Int64)::Bool
    isPalindrome(num) && isPalindrome(base10to2(num)) && return true
    return false
end

function sumAllPalindromesBasesUnder(num::Int64)::Int64
    totalSum = 0
    for i in 1:num-1
        isPalindromeBases(i) && (totalSum += i)
    end
    return totalSum
end

const NUM = 1000000
println(@time sumAllPalindromesBasesUnder(NUM))

# answer: 872187
# 0.116432 seconds (3.10 M allocations: 126.368 MiB, 10.58% gc time)
