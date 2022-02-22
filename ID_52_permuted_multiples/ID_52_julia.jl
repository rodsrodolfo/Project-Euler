function checkNum(num::Int64)::Bool
    digits_num = sort(digits(num))
    curr = num
    for i in 2:6
        curr += num
        sort(digits(curr)) != digits_num && return false
    end
    return true
end

function findFirstPermuted6()::Int64
    test = 0
    while true
        test += 1
        checkNum(test) && return test
    end
end

println(@time findFirstPermuted6())

# answer: 142857
# 0.064252 seconds (571.59 k allocations: 56.424 MiB, 4.37% gc time)
