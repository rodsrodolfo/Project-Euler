#= Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum. =#

function sumSquares(num)
    f(x) = x^2
    squares = f.(1:num)
    return BigInt(sum(squares))
end

function squareSum(num)
    summation = BigInt(sum(1:num))
    return summation^2
end

num = 100

@time diff = squareSum(num) - sumSquares(num)

println("Difference is $diff")

# answer: 25164150