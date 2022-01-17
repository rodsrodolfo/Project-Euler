#= 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? =#

function factorization(num)
    factorization = Dict()
    factor = 2
    while num != 1
        if num % factor == 0
            haskey(factorization, factor) ? factorization[factor] += 1 : factorization[factor] = 1
            num /= factor
        else
            factor == 2 ? factor += 1 : factor += 2
        end
    end
    return factorization
end

num = 20

factorizationSmallest = Dict()

for i in 2:num, (factor, counter) in factorization(i)
    if haskey(factorizationSmallest, factor)
        factorizationSmallest[factor] = max(factorizationSmallest[factor], counter)
    else
        factorizationSmallest[factor] = counter
    end
end

smallest = 1

for (factor, counter) in factorizationSmallest
    global smallest *= factor ^ counter
end

println("Smallest number divisible by all integers from 1 to $num is: $smallest")

# answer: 232792560