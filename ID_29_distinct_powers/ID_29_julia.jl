function factorization(num::Int64)::Dict{Int64,Int64}
    factorization = Dict{Int64,Int64}()
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

function distinctPowers(A::Int64, B::Int64)::Int64
    distinctPowersList = Dict{Int64,Int64}[]
    for a in 2:A
        factoringA = factorization(a)
        for b in 2:B
            factoringAB = copy(factoringA)
            for key in keys(factoringAB)
                factoringAB[key] *= b
            end
            !(factoringAB in distinctPowersList) && push!(distinctPowersList, factoringAB)
        end
    end
    return length(distinctPowersList)
end

const A, B = 100, 100
println(@time distinctPowers(A, B))

# answer: 9183
# 0.354541 seconds (39.61 k allocations: 5.455 MiB)
