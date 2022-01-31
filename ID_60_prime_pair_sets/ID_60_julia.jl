using Combinatorics

function isPrime(num)
    (num == 0 || num == 1) && (return false)
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function setIsPrime(set)
    for index in eachindex(set)
        !isPrime(set[index]) && return false
    end
    return true
end

function possibleConcatenations(set::Vector{Int64})
    lenSet = length(set)
    concatenations = Int64[]
    for i in 1:lenSet-1
        for j in i+1:lenSet
            iSet = set[i]
            jSet = set[j]
            push!(concatenations, iSet*(10^length(digits(jSet))) + jSet)
            push!(concatenations, jSet*(10^length(digits(iSet))) + iSet)
        end
    end
    return concatenations
end

function pushNextPrime(set::Vector{Int64})
    length(set) == 0 && return [2]
    next = set[begin] + 1
    while !(isPrime(next))
        next += 1
    end
    return pushfirst!(set, next)
end

function lowestSumSetOf(num)
    currentPool = Int64[3]
    while length(currentPool) < num
        currentPool = pushNextPrime(currentPool)
    end

    flagFirstSetFound = false
    foundSet = Int64[]
    lowestSum = 0

    while !flagFirstSetFound
        for subset in combinations(currentPool[2:end], num-1)
            subset = vcat(currentPool[begin], subset)
            if setIsPrime(possibleConcatenations(subset))
                flagFirstSetFound = true
                foundSet = subset
                lowestSum = sum(subset)
                break
            end
        end
        pushNextPrime(currentPool)
        @show currentPool[begin]
    end
    return lowestSum, foundSet
end