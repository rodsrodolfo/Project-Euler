function lastXdigitsPower(x::Int64, num::Int64, power::Int64)::Int64
    result = num
    for _ in 2:power
        result *= num
        result %= 10^x
    end
    return result
end

function sumSelfPowersLastXDigits(num::Int64, x::Int64)::String
    totalSum = 0
    for i in 1:num
        totalSum += lastXdigitsPower(x, i, i)
    end
    totalSum = string(totalSum % 10^x)
    return length(totalSum) < x ? "0"^(10-length(totalSum))*totalSum : totalSum
end

const NUM = 1000
const X = 10
println(@time sumSelfPowersLastXDigits(NUM, X))

# answer: 9110846700
# 0.006702 seconds (2 allocations: 96 bytes)
