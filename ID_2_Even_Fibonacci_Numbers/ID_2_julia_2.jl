#= 
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
=#
function sum_even_fib(num::Int64)
    fib1::Int64, fib2::Int64, fib_sum::Int64 = 1, 2, 0
    while fib2 < num
        if fib2 % 2 == 0
            fib_sum += fib2
        end
        fib1, fib2 = fib2, fib1 + fib2
    end
    return fib_sum
end

println(@time sum_even_fib(4_000_000))

# answer: 4613732
