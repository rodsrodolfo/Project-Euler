function isPandigital(num::Int64)::Bool
    sort(digits(num)) != 1:9 && return false
    return true
end

function concatenateNumbers(num1::Int64, num2::Int64)::Int64
    return num1 * 10^ndigits(num2) + num2
end

function possibleCandidateNum(num::Int64)::Int64
    limit = 1
    concatenationProduct = num
    while ndigits(concatenationProduct) <= 8
        limit += 1
        concatenationProduct = concatenateNumbers(concatenationProduct, num * limit)
    end
    return concatenationProduct
end

function findLargestPandigitalMultiple()
    maxLimit = 987654321 ÷ 11
    maxFound = 0
    for tryNum in 1:maxLimit
        concatenationProduct = possibleCandidateNum(tryNum)
        ndigits(concatenationProduct) == 9 && concatenationProduct > maxFound && isPandigital(concatenationProduct) && (maxFound = concatenationProduct)
    end
    return maxFound
end

println(@time findLargestPandigitalMultiple())

# answer: 932718654
# 2.640177 seconds (1.65 k allocations: 206.000 KiB)
