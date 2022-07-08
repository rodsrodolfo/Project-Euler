#= 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? =#

function is_divisable(num)
    for i in 1:20
        if num % i != 0
            return false
        end
    end
    true
end

function main()
    num = 20
    while !is_divisable(num)
        num += 1
    end
    println(num)
end

@time main()