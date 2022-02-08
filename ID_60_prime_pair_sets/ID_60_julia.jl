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

function concatenateNums(pair::Tuple{Int64,Int64})::Int64
    return pair[1] * 10^ndigits(pair[2]) + pair[2]
end

function areConcatenationsAllPrime(set::Tuple{Int64,Int64})::Bool
    isPrime(concatenateNums(set)) && isPrime(concatenateNums(reverse(set))) && return true
    return false
end

function isGoodPair(pair::Tuple{Int64,Int64})::Bool
    areConcatenationsAllPrime(pair) && return true
    return false
end

function isThereASet(good::Dict{Int64,Vector{Int64}})::Int64
    for prime1 in sort(collect(keys(good)))
        good1 = good[prime1]
        for prime2 in good1
            good2 = filter((i) -> i in good1, good[prime2])
            for prime3 in good2
                good3 = filter((i) -> i in good1 && i in good2, good[prime3])
                for prime4 in good3
                    good4 = filter((i) -> i in good1 && i in good2 && i in good3, good[prime4])
                    for prime5 in good4
                        setFound = (prime1, prime2, prime3, prime4,prime5)
                        println(setFound)
                        return sum(setFound)
                    end
                end
            end
        end
    end
    return false
end

function lowestSum5ConcatenatablePrimes()::Int64
    listPrimes = Int64[3, 7]
    goodPairs = Dict{Int64,Vector{Int64}}(i => Int64[] for i in listPrimes)
    badPairs = Dict{Int64,Vector{Int64}}(i => Int64[] for i in listPrimes)
    while true
        lastPrime = listPrimes[end]
        for otherPrime in listPrimes[1:end-1]
            if  isGoodPair((otherPrime, lastPrime))
                push!(goodPairs[otherPrime], lastPrime)
            else
                push!(badPairs[otherPrime], lastPrime)
            end
        end
        setFound = isThereASet(goodPairs)
        setFound != false && return setFound
        nextPrime = nextPrimeSet(listPrimes)
        push!(listPrimes, nextPrime)
        goodPairs[nextPrime] = Int64[]
        badPairs[nextPrime] = Int64[]
    end
end

println(@time lowestSum5ConcatenatablePrimes())

# answer: 26033
