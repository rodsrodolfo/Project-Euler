function isFactorialOfDigits(num::Int64)::Bool
    digitsNum = digits(num)
    num == sum(factorial.(digitsNum)) && return true
    return false
end

function findMaxFactorialDigits()::Int64
    i = 1
    while parse(Int, "9"^i) < i * factorial(9)
        i += 1
    end
    return i * factorial(9)
end

function sumAllFactorialOfDigits()::Int64
    totalSum = 0
    for i in 3:findMaxFactorialDigits()
        isFactorialOfDigits(i) && (totalSum += i)
    end
    return totalSum
end

println(@time sumAllFactorialOfDigits())

# answer: 40730
# 0.360996 seconds (5.08 M allocations: 539.554 MiB, 5.09% gc time)
