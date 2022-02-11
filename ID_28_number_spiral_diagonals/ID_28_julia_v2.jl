function sumDiagonalsOddMatrix(matrix::Matrix{Int64})::Int64
    sideLength = size(matrix, 1)
    sumDiagonals = -matrix[(sideLength+1)÷2, (sideLength+1)÷2]
    for i in 1:sideLength
        sumDiagonals += matrix[i, i]
        sumDiagonals += matrix[i, sideLength-i+1]
    end
    return sumDiagonals
end

function spiral(sideLength::Int64)::Matrix{Int64}
    spiral = ones(Int64, sideLength, sideLength)
    currNum = 1
    center = (sideLength + 1) ÷ 2
    for i in 1:sideLength÷2
        for j in 0:i*2-1
            currNum += 1
            spiral[center-(i-1)+j, center+i] = currNum
        end
        for j in 0:i*2-1
            currNum += 1
            spiral[center+i, center+(i-1)-j] = currNum
        end
        for j in 0:i*2-1
            currNum += 1
            spiral[center+(i-1)-j, center-i] = currNum
        end
        for j in 0:i*2-1
            currNum += 1
            spiral[center-i, center-(i-1)+j] = currNum
        end
    end
    return spiral
end

function sumDiagonalsSpiral(sideLength)
    return sumDiagonalsOddMatrix(spiral(sideLength))
end

const NUM = 1001
println(@time sumDiagonalsSpiral(NUM))

# answer: 669171001
# 0.004830 seconds (2 allocations: 7.645 MiB)
