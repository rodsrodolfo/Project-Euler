function isPrime(num::Int64)::Bool
    num < 2 && return false
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

function isPandigital(num::Int64, n::Int64)::Bool
    sort(digits(num)) == 1:n && return true
    return false
end

function largestPandigitalPrime()::Int64
    for i in 7654321:-2:3
        digits(i)[1] in [1, 3, 7] && isPandigital(i, ndigits(i)) && isPrime(i) && (return i)
    end
end

println(@time largestPandigitalPrime())

# answer: 7652413
