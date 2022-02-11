function isPrime(num::Int64)::Bool
    num < 2 && return false
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

# function arrayToNumber(array::Vector{Int64})::Int64
#     num = 0
#     lengthArray = length(array)
#     for index in 1:lengthArray
#         num += array[index] * 10^(lengthArray - index)
#     end
#     return num
# end

function listOfDigitsCyclesOtherThan(num::Int64)::Vector{Int64}
    listOfCycles = Int64[]
    currCycle = string(num)
    for cycle in 1:ndigits(num)-1
        currCycle = currCycle[2:end] * currCycle[1]
        push!(listOfCycles, parse(Int64, currCycle))
    end
    return listOfCycles
end

function isAllOdd(num::Int64)::Bool
    for digit in digits(num)
        iseven(digit) && return false
    end
    return true
end

function isCircular(num::Int64)::Bool
    if isPrime(num)
        for cycle in listOfDigitsCyclesOtherThan(num)
            !isPrime(cycle) && return false
        end
        return true
    end
    return false
end

function countCircularUnder(num::Int64)::Int64
    count = 1
    for possible in 3:num
        isAllOdd(possible) && isCircular(possible) && (count += 1)
    end
    return count
end

const NUM = 1000000
println(@time countCircularUnder(NUM))

# answer: 55
# 0.131017 seconds (1.07 M allocations: 107.842 MiB, 12.72% gc time)
