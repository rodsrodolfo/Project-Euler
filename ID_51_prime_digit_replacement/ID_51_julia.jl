using Combinatorics, Primes

function replaceDigits(positions::Vector{Int64}, digits_num::Vector{Int64})::Vector{Int64}
    results = Int64[]
    digits_num = enumerate(digits_num)
    for substitute in (length(digits_num) in positions ? 1 : 0):9
        result = 0
        for (index, digit) in digits_num
            result += index in positions ? substitute * 10^(index - 1) : digit * 10^(index - 1)
        end
        push!(results, result)
    end
    return results
end

function familySize(list::Vector{Int64})::Int64
    primeCount = 0
    for i in list
        if isprime(i)
            primeCount += 1
        end
    end
    return primeCount
end

function checkIfSame(positions::Vector{Int64}, digits_num::Vector{Int64})::Bool
    digit = digits_num[positions[1]]
    for i in 2:length(positions)
        if digits_num[positions[i]] != digit
            return false
        end
    end
    return true
end

function checkIfFound(positions_list,prime)
    for positions in positions_list
        prime_digits = digits(prime)
        if checkIfSame(positions, prime_digits)
            replacements = replaceDigits(positions, prime_digits)
            familySize(replacements) == X && return true
        end
    end
    return false
end

function firstPrimeXFamily(X::Int64)::Int64
    power = 0
    while true
        for prime in primes(10^power + 1, 10^(power + 1) - 1), j in 1:power+1
            if checkIfFound(combinations(1:power+1, j),prime)
                return prime
            end 
        end
        power += 1
    end
end

const X = 8
println(@time firstPrimeXFamily(X))

# answer: 121313
# 0.349678 seconds (1.83 M allocations: 128.236 MiB, 4.92% gc time, 28.56% compilation time)
