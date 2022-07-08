#= If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000. =#

function sumMultiples3and5below(num::Int64)::Int64
    multiplesSum = 0
    for i in 1:num
        if i % 3 == 0 || i % 5 == 0
            multiplesSum += i
        end
    end
    return multiplesSum
end

const NUM = 1000
println(@time sumMultiples3and5below(NUM))

# answer = 233168
# 0.000004 seconds
