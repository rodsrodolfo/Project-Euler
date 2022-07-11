#= Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms. =#

function nextPair(pair::Tuple{Int64,Int64})::Tuple{Int64,Int64}
    return (pair[2], sum(pair))
end

function findSumEvenFibUnder(num::Int64)::Int64
    evenSum = 0
    currentPair = (1, 2)
    while currentPair[2] < num
        if iseven(currentPair[2])
            evenSum += currentPair[2]
        end
        currentPair = nextPair(currentPair)
    end
    return evenSum
end

const NUM = 4000000
println(@time findSumEvenFibUnder(NUM))

# answer: 4613732
# 0.000001 seconds