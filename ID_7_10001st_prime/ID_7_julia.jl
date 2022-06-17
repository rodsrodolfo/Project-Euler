#= What is the 10001st prime number? =#

function isPrime(num)
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function nth_prime(nth)
    test = 3
    found = 1
    while found < nth
        if isPrime(test)
            found += 1
        end
        test += 2
    end
    return test - 2
end

const nth = 10001

@time nth_prime_found = nth_prime(nth)

println("$(nth)st prime is $nth_prime_found")

# answer: 104743
# 0.010568 seconds (1 allocation: 16 bytes)
