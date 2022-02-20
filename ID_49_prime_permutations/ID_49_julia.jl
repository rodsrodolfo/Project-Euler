using Primes

function isPermutation(num1::Int64, num2::Int64)::Bool
    return sort(digits(num1)) == sort(digits(num2)) ? true : false
end

function findSequenceStarting(num::Int64, max::Int64)::Tuple{Int64,Int64,Int64}
    max_pace = (max - num) ÷ 2
    for pace in 2:2:max_pace
        second = num + pace
        if isprime(second) && isPermutation(num, second)
            third = second + pace
            if isprime(third) && isPermutation(num, third)
                return (num, second, third)
            end
        end
    end
    return (0, 0, 0)
end

function findSequence()
    for i in filter!(i -> i != 1487, primes(1001, 9997))
        iSequence = findSequenceStarting(i, 9999)
        iSequence != (0, 0, 0) && return iSequence
    end
end

println(@time join(findSequence()))

# answer: 296962999629
# 0.347519 seconds (774.71 k allocations: 54.065 MiB, 5.37% gc time, 48.19% compilation time)
