function isPrime(num::Int64)::Bool
    num < 2 && return false
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function isTruncatable(num::Int64)::Bool
    !isPrime(num) && return false
    ndigitsNum = ndigits(num)
    for cut in 1:ndigitsNum-1
        (!isPrime(num % 10^cut) || !isPrime(num ÷ 10^cut)) && return false
    end
    return true
end

function sumAllTruncatable()::Int64
    found = 0
    sumFound = 0
    tryNum = 9
    while found < 11
        tryNum += 1
        if isTruncatable(tryNum)
            found += 1
            sumFound += tryNum
        end
    end
    return sumFound
end

println(@time sumAllTruncatable())

# answer: 748317
# 0.133933 seconds
