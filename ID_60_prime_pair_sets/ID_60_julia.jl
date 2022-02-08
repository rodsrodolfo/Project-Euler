using Combinatorics

function isPrime(num::Int64)::Bool
    num < 2 && return false
    for i in 2:trunc(Int, √num)
        num % i == 0 && return false
    end
    return true
end

function nextPrimeSet(set::Vector{Int64})::Int64
    set == [] && return 2
    latestPrime = set[end]
    nextPrime = latestPrime + 1
    while !isPrime(nextPrime)
        nextPrime
        nextPrime += 1
    end
    return nextPrime
end

function sumFourFirstPrimes()::Int64
    foundPrimes = 0
    totalSum = 0
    testNum = 1
    while foundPrimes < 4
        testNum += 1
        if isPrime(testNum)
            foundPrimes += 1
            totalSum += testNum
        end
    end
    return totalSum
end

function concatenateNums(pair::Vector{Int64})::Int64
    return pair[1] * 10^ndigits(pair[2]) + pair[2]
end

function possibleConcatenations(set::Tuple{Int64,Int64})::Vector{Int64}
    return map(concatenateNums, permutations(set, 2))
end

function setIsPrime(set::Vector{Int64})::Bool
    for number in set
        !isPrime(number) && return false
    end
    return true
end

function areConcatenationsAllPrime(set::Tuple{Int64,Int64})::Bool
    for subset in possibleConcatenations(set)
        !isPrime(subset) && return false
    end
    return true
end

function isGoodPair(pair::Tuple{Int64,Int64})::Bool
    areConcatenationsAllPrime(pair) && return true
    return false
end

function isThereASet(good)
    for prime1 in sort(collect(keys(good)))
        good1 = good[prime1]
        for prime2 in good1
            good2 = filter((i) -> i in good1, good[prime2])
            for prime3 in good2
                good3 = filter((i) -> i in good1 && i in good2, good[prime3])
                for prime4 in good3
                    good4 = filter((i) -> i in good1 && i in good2 && i in good3, good[prime4])
                    good4 != [] && (return (prime1, prime2, prime3, prime4, good4[1]), sum((prime1, prime2, prime3, prime4, good4[1])))
                end
            end
        end
    end
    return false
end

function lowestSumConcatenatablePrimes()
    listPrimes = Int64[3, 7]
    goodPairs = Dict{Int64,Vector{Int64}}(i => Int64[] for i in listPrimes)
    badPairs = Dict{Int64,Vector{Int64}}(i => Int64[] for i in listPrimes)
    flagSetFound = false
    while !(flagSetFound)
        lastPrime = listPrimes[end]
        for otherPrime in listPrimes[1:end-1]
            isGoodPair((otherPrime, lastPrime)) ? push!(goodPairs[otherPrime], lastPrime) : push!(badPairs[otherPrime], lastPrime)
        end
        setFound = isThereASet(goodPairs)
        setFound != false && return setFound
        nextPrime = nextPrimeSet(listPrimes)
        push!(listPrimes, nextPrime)
        goodPairs[nextPrime] = Int64[]
        badPairs[nextPrime] = Int64[]
    end
    return printSortedDict(goodPairs)
end

function printSortedDict(dict::Dict)
    for key in sort(collect(keys(dict)))
        println("$key => $(dict[key])")
    end
end

println(@time lowestSumConcatenatablePrimes())

# answer: 
