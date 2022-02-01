function isSumOfDigitsToPower(num::Int64, power::Int64)::Bool
    digitsNum = digits(num)
    sumDigitsToPower = sum(digitsNum.^power)
    sumDigitsToPower == num && return true
end

function findSumAllSumOfDigitsToPower(power::Int64)::Int64
    sumFound = 0
    maxNum = parse(Int64,"9"^(power+1))
    for i in 2:maxNum
        isSumOfDigitsToPower(i,power) && (sumFound += i)
    end
    return sumFound
end

const POWER = 5
println(@time findSumAllSumOfDigitsToPower(POWER))

# answer: 443839