function fileToTriangularMatrix(path)
    triangleString = split.(readlines(path))
    triangleMatrix = [i <= length(line) ? parse(Int, line[i]) : 0 for line in triangleString, i in 1:length(triangleString)]
    return triangleMatrix
end

function maxPathSum(path)
    matrix = fileToTriangularMatrix(path)
    for i in size(matrix)[1]-1:-1:1, j in 1:i
        matrix[i, j] += max(matrix[i+1, j], matrix[i+1, j+1])
    end
    return matrix[1, 1]
end

filePath = "/home/mateus/Documents/Coding/Project Euler/ID_18_maximum_path_sum_I/ID_18_source.txt"

println(@time maxPathSum(filePath))

# answer: 1074
# 0.143577 seconds (523.58 k allocations: 28.637 MiB, 99.75% compilation time)
