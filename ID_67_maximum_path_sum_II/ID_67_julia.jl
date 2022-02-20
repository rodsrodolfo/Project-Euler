function triangleMatrix(path)
    triangleString = readlines(path)
    return vcat([hcat([i <= length(split(line)) ? parse(Int, split(line)[i]) : 0 for i in 1:length(triangleString)]...) for line in triangleString]...)
end

function maxPathSum(path)
    tMatrix = triangleMatrix(path)
    for i in size(tMatrix)[1]-1:-1:1, j in 1:i
        tMatrix[i, j] += max(tMatrix[i+1, j], tMatrix[i+1, j+1])
    end
    return tMatrix[1, 1]
end

const PATH = "/home/mateus/Documents/Coding/Project Euler/ID_67_maximum_path_sum_II/ID_67_source.txt"
println(@time maxPathSum(PATH))

# answer: 7273
# 0.239298 seconds (504.96 k allocations: 83.919 MiB, 6.28% gc time, 61.94% compilation time)
