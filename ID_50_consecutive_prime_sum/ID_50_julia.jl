using Primes

function primesSequence(num::Int64)::Vector{Int64}
    list = primes(2, num ÷ 2)
    while sum(list[end-1:end]) <= num
        push!(list, nextprime(list[end] + 1))
    end
    return list[begin:end-1]
end

function findSequence(list::Vector{Int64}, len::Int64, i::Int64, num::Int64)::Tuple{Int64,Int64}
    if iseven(i)
        currSum = sum(list[1:i])
        currSum < num && isprime(currSum) && return currSum, i
    else
        for j in 0:len-i
            currSum = sum(list[1+j:i+j])
            currSum < num && isprime(currSum) && return currSum, i
        end
    end
    return (0, 0)
end

function maxLength(num::Int64)::Int64
    maxprime = 2
    while sum(primes(2, maxprime)) < num
        maxprime = nextprime(maxprime + 1)
    end
    maxLength = 1
    while prime(maxLength) != maxprime
        maxLength += 1
    end
    return maxLength
end

function longestSequence(num::Int64)::Tuple{Int64,Int64}
    list = primesSequence(num)
    len = length(list)
    for i in maxLength(num):-1:2
        currResult = findSequence(list, len, i, num)
        currResult != (0, 0) && return currResult
    end
    return (0, 0)
end

println(@time longestSequence(1_000_000))

# answer: 997651
# 0.222087 seconds (288.15 k allocations: 364.824 MiB, 8.94% gc time, 49.65% compilation time)
