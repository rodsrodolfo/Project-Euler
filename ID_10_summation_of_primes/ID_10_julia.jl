#= The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million. =#

function isPrime(num::Int64)
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function primeSumBelowNUM(num::Int64)
    totalSum = 2
    for i in 3:2:num-1
        if isPrime(i)
            totalSum += i
        end
    end
    return totalSum
end

printResultID10(num::Int64) = println(@time primeSumBelowNUM(num))

const NUM = 2000000

printResultID10(NUM)

# answer: 142913828922
# 0.500120 seconds
