using Combinatorics

function isPandigital(num::Int64, interval::UnitRange{Int64})::Bool
    sort(digits(num)) == interval && return true
    return false
end

function hasProperty(num::Int64, limitsAndPrimes::NTuple{7, Tuple{Int64, Int64, Int64}})::Bool
    for combination in limitsAndPrimes
        (num % 10^(10 - (combination[1] - 1))) ÷ 10^(10 - combination[2]) % combination[3] != 0 && return false
    end
    return true
end

function generatePandigitalList(interval::UnitRange{Int64})::Vector{Int64}
    return map((d) -> sum([d[k]*10^(k-1) for k=1:length(d)]), collect(permutations(interval)))
end

function findSum()::Int64
    totalSum = 0
    intervalPandigitality = 0:9
    limitsAndPrimes = ((2, 4, 2), (3, 5, 3), (4, 6, 5), (5, 7, 7), (6, 8, 11), (7, 9, 13), (8, 10, 17))
    for i in generatePandigitalList(intervalPandigitality)
        hasProperty(i, limitsAndPrimes) && (totalSum += i)
    end
    return totalSum
end

println(@time findSum())

# answer: 16695334890
