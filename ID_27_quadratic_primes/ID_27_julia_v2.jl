function isPrime(num)
    num < 2 && return false
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function quadratic(n, a, b)
    return n^2 + a*n + b
end

function consecutivePrimes(a, b)
    count = 0
    tryNum = 0
    while true
        currResult = quadratic(tryNum, a, b)
        !isPrime(currResult) && (return count)
        count += 1
        tryNum += 1
    end
end

function longestConsecutivePrimes(modA, modB)
    longest = (0,0,0)
    for a in -modA:modA, b in -modB:modB
        consecutive = consecutivePrimes(a, b)
        longest[1] < consecutive && (longest = (consecutive, a, b))
    end
    return longest
end

A, B = 999, 1000
@time size, a, b = longestConsecutivePrimes(A, B)
println("size: $size, a: $a, b: $b")
println("a*b = $(a*b)")
