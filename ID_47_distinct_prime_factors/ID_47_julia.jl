using Primes

function nUniqueFactors(n::Int64)::Int64
    return length(unique(factor(Vector, n)))
end

function firstXdistinct(x::Int64)::Int64
    listFactors = map(nUniqueFactors, 1:x)
    test = 1
    while unique(listFactors[end-(x-1):end]) != [x]
        test += 1
        push!(listFactors, nUniqueFactors(test + x))
        popfirst!(listFactors)
    end
    return test +1
end

const X = 4
println(@time firstXdistinct(X))

# anwer: 134043
# 0.205736 seconds (3.35 M allocations: 271.720 MiB, 13.16% gc time)
