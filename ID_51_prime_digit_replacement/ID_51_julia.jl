using Combinatorics, Primes

function replaceDigits(positions::Vector{Int64}, num::Int64)::Vector{Int64}
    results = Int64[]
    digits_num = enumerate(digits(num))
    for substitute in (ndigits(num) in positions ? 1 : 0):9
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

function firstPrimeXFamily(X::Int64)::Tuple{Int64, Vector{Int64}}
    power = 0
    while true
        println("searching power = $power")
        for prime in primes(10^power + 1, 10^(power + 1) - 1), j in 1:power+1
            positions_list = combinations(1:power+1, j)
            for positions in positions_list
                replacements = replaceDigits(positions, prime)
                prime in replacements && familySize(replacements) == X && return prime, positions
            end
        end
        power += 1
    end
end

const X=8
println(@time firstPrimeXFamily(X))

# answer: 121313
# 0.536361 seconds (2.78 M allocations: 274.136 MiB, 4.76% gc time, 19.73% compilation time)
