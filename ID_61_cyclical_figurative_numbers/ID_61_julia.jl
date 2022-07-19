triangle(n) = n * (n + 1) / 2
isTriangle(num) = isinteger((-1 + √(1 + 8 * num)) / 2) ? true : false

square(n) = n^2
isSquare(num) = isinteger(√num) ? true : false

pentagonal(n) = n * (3 * n - 1) / 2
isPentagonal(num) = isinteger((1 + √(1 + 24 * num)) / 6) ? true : false

hexagonal(n) = n * (2 * n - 1)
isHexagonal(num) = isinteger(1 + (√(1 + 8 * num)) / 6) ? true : false

heptagonal(n) = n * (5 * n - 3) / 2
isHeptagonal(num) = isinteger((3 + √(9 + 40 * num)) / 10) ? true : false

octagonal(n) = n * (3 * n - 2)
isOctagonal(num) = isinteger((2 + √(4 + 12 * num)) / 6) ? true : false

function checkCyclic()
    for i in 1000:9999
        dig = digits(i)
        if dig[3] != 0
            
        end
    end
end

# answer: 
# 
