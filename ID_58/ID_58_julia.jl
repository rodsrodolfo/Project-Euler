using Primes

function vertices(sidelength::Int64)::Tuple{Int64,Int64,Int64}
    difference = sidelength - 1
    vertice1 = sidelength^2
    vertice2 = vertice1 - difference
    vertice3 = vertice2 - difference
    vertice4 = vertice3 - difference
    return (vertice2, vertice3, vertice4)
end

function countPrimes(list::Tuple{Int64,Int64,Int64})::Int64
    return sum(map(isprime, list))
end

function sideLengthPrimesBelow(percentage::Int64)::Int64
    diagonalLength = 1
    total_primes = 0
    side_length = 1
    if side_length == 1
        side_length += 2
        diagonalLength += 4
        total_primes += countPrimes(vertices(side_length))
    end
    while total_primes / diagonalLength >= percentage / 100
        side_length += 2
        diagonalLength += 4
        total_primes += countPrimes(vertices(side_length))
    end
    return side_length
end

const PERCENTAGE = 10
println(@time sideLengthPrimesBelow(PERCENTAGE))

# answer: 26241
# 0.009001 seconds (15.32 k allocations: 239.344 KiB)
