#= 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? =#

function factorization(num::Int64)::Dict{Int64,Int64}
    factorization = Dict()
    factor = 2
    while num != 1
        if num % factor == 0
            haskey(factorization, factor) ? factorization[factor] += 1 : factorization[factor] = 1
            num /= factor
        else
            factor == 2 ? factor += 1 : factor += 2
        end
    end
    return factorization
end

function numFromFactorization(factorization::Dict{Int64,Int64})::Int64
    return prod(map((pair)->pair[1]^pair[2],(factor,power) for (factor,power) in factorization))
end

function factorizationSmallestMultiple(num::Int64)::Dict{Int64,Int64}
    factorizationSmallest = Dict()
    for i in 2:num, (factor, counter) in factorization(i)
        factorizationSmallest[factor] = haskey(factorizationSmallest, factor) ? max(factorizationSmallest[factor], counter) : counter
    end
    return factorizationSmallest
end

const NUM = 20
println(@time numFromFactorization(factorizationSmallestMultiple(NUM)))

# answer: 232792560
