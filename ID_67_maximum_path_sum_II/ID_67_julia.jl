@time triangleString = readlines("/home/mateus/Documents/Coding/Project Euler/ID_67_maximum_path_sum_II/ID_67_source.txt")

@time triangleMatrix = vcat([hcat([i <= length(split(line)) ? parse(Int, split(line)[i]) : 0 for i in 1:length(triangleString)]...) for line in triangleString]...)

function maxPathSum(tMatrix)
    for i in size(tMatrix)[1]-1:-1:1, j in 1:i
        tMatrix[i, j] += max(tMatrix[i+1, j], tMatrix[i+1, j+1])
    end
    return tMatrix[1, 1]
end

println(@time maxPathSum(triangleMatrix))

# answer: 7273
