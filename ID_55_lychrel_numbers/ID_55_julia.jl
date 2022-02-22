function isPalindrome(num::BigInt)::Bool
    digits_num = digits(num)
    ndigits_num = ndigits(num)
    for index in 1:ndigits_num÷2
        digits_num[index] != digits_num[end-index+1] && return false
    end
    return true
end

function Base.reverse(num::BigInt)::BigInt
    return (parse(BigInt,join(digits(num))))
end

function isLychrell(num::Int64)::Bool
    for _ in 1:50
        num = BigInt(num) + reverse(BigInt(num))
        isPalindrome(num) && return false
    end
    return true
end

function countLychrel(num::Int64)::Int64
    return sum(map(isLychrell,1:num))
end

const NUM=10000
println(@time countLychrel(NUM))

# answer: 249
# 0.177972 seconds (1.93 M allocations: 76.145 MiB, 16.50% gc time, 16.21% compilation time)
