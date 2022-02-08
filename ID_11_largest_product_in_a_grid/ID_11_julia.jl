using DelimitedFiles

function findMaxProductVertical(matrix::Matrix{Float64}, num::Int64)::Float64
    num = num - 1
    maxFound = 0
    lines, columns = size(matrix)
    for line in 1:lines-num, column in 1:columns
        product = prod(matrix[line:line+num, column])
        maxFound = max(maxFound, product)
    end
    return maxFound
end

function findMaxProductHorizontal(matrix::Matrix{Float64}, num::Int64)::Float64
    num = num - 1
    maxFound = 0
    lines, columns = size(matrix)
    for line in 1:lines, column in 1:columns-num
        product = prod(matrix[line, column:column+num])
        maxFound = max(maxFound, product)
    end
    return maxFound
end

function findMaxProductDiagonal(matrix::Matrix{Float64}, num::Int64)::Float64
    num = num - 1
    maxFound = 0
    lines, columns = size(matrix)
    for line in 1:lines-num, column in 1:columns-num
        product = 1
        for i in 0:num
            product *= matrix[line+i, column+i]
        end
        maxFound = max(maxFound, product)
    end
    for line in 1:lines-num, column in num+1:columns
        product = 1
        for i in 0:num
            product *= matrix[line+i, column-i]
        end
        maxFound = max(maxFound, product)
    end
    return maxFound
end

function answer(matrix::Matrix{Float64}, num::Int64)::Float64
    ho = findMaxProductVertical(matrix, num)
    ve = findMaxProductHorizontal(matrix, num)
    di = findMaxProductDiagonal(matrix, num)
    return max(ho, ve, di)
end

const NUM = 4
println(@time Int(answer(readdlm("/home/mateus/Documents/Coding/Project Euler/ID_11_largest_product_in_a_grid/ID_11_source.txt"), NUM)))

# answer: 70600674
