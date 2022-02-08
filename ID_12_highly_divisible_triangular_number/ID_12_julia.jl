#= What is the value of the first triangle number to have over five hundred divisors? =#

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

function numberOfDivisors(num)
    numberOfDivisors = prod([(exponent + 1) for (prime, exponent) in factorization(num)])
end

function smallestTriangular(num)
    last = 2
    triangular = 3

    while numberOfDivisors(triangular) < num
        last += 1
        triangular += last
    end

    return triangular
end

num = 500

println(@time smallestTriangular(num))

# answer: 76576500