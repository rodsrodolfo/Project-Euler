#=
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=#


function multiples_3_5(num::Int64)
    sum_multiples::Int64 = 0
    for i in 1:num
        if i % 3 == 0 || i % 5 == 0
            sum_multiples += i
        end
    end
    return sum_multiples
end


println(@time multiples_3_5(999))

# answer: 233168
