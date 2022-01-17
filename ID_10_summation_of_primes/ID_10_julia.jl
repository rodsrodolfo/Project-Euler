#= The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million. =#

function isPrime(num::Integer)
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

num = 2000000

primeSum = 2
primeSum = 2

for i in 3:2:num-1
    if isPrime(i)
        global primeSum += i
    end
end

println("Sum of primes below $num is: $primeSum")

# answer: 142913828922