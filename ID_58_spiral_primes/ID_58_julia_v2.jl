using Primes

function primeVertices(sidelength::Int64)::Int64
    totalPrimes = 0
    difference = sidelength - 1
    vertice = sidelength^2
    for _ in 1:3
        vertice -= difference
        if isprime(vertice)
            totalPrimes += 1
        end
    end
    return totalPrimes
end

function sideLengthPrimesBelow(percentage::Int64)::Int64
    diagonalLength = 1
    total_primes = 0
    side_length = 1
    if side_length == 1
        side_length += 2
        diagonalLength += 4
        total_primes += primeVertices(side_length)
    end
    while total_primes / diagonalLength >= percentage / 100
        side_length += 2
        diagonalLength += 4
        total_primes += primeVertices(side_length)
    end
    return side_length
end

const PERCENTAGE = 10
println(@time sideLengthPrimesBelow(PERCENTAGE))

# answer: 26241
# 0.009001 seconds (15.32 k allocations: 239.344 KiB)
