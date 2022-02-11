using Primes

function isConjecture(num::Int64)::Bool
    prime = 2
    while prime <= num - 2
        test = (num - prime) / 2
        isinteger(test) && isinteger(√test) && return true
        prime = nextprime(prime + 1)
    end
    return false
end

function firstNonConjecture()::Int64
    test = 9
    while isConjecture(test) || isprime(test)
        test += 2
    end
    return test
end

println(@time firstNonConjecture())

# answer: 5777
# 0.018999 seconds (29.93 k allocations: 467.609 KiB)
