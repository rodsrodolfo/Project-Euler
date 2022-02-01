function isPrime(num::Int64)::Bool
    num < 2 && return false
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function quadratic(n::Int64, a::Int64, b::Int64)::Int64
    return n^2 + a*n + b
end

function consecutivePrimes(a::Int64, b::Int64)::Int64
    count = 0
    tryNum = 0
    while true
        currResult = quadratic(tryNum, a, b)
        !isPrime(currResult) && (return count)
        count += 1
        tryNum += 1
    end
end

function longestConsecutivePrimes(modA::Int64, modB::Int64)::Tuple{Int64, Int64, Int64}
    longest = (0,0,0)
    for a in -modA:modA, b in -modB:modB
        consecutive = consecutivePrimes(a, b)
        longest[1] < consecutive && (longest = (consecutive, a, b))
    end
    return longest
end

const A, B = 999, 1000
@time size, a, b = longestConsecutivePrimes(A, B)
println("size: $size, a: $a, b: $b")
println("a*b = $(a*b)")

# answer: -59231
