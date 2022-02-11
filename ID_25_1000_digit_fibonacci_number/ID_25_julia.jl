function makeSameLength(a::Vector{Int64}, b::Vector{Int64})
    for _ in 1:length(b)-length(a)
        pushfirst!(a, 0)
    end
    return a, b
end

function makeMatrix(a::Vector{Int64}, b::Vector{Int64})
    a, b = makeSameLength(a, b)
    return hcat(a, b)
end

function sumLinesTuple(pair::Tuple{Vector{Int64},Vector{Int64}})
    mat = makeMatrix(pair[1], pair[2])
    result = Int64[]
    remainder = 0
    for line in size(mat)[1]:-1:1
        partialSum = remainder + sum(mat[line, :])
        pushfirst!(result, partialSum % 10)
        remainder = partialSum ÷ 10
    end
    remainder != 0 && pushfirst!(result, remainder)
    return result
end

function fibNUMdigits(num::Int64)
    currPair = ([1], [2])
    count = 3
    while length(currPair[2]) < num
        currPair = (currPair[2], sumLinesTuple(currPair))
        count += 1
    end
    return count
end

const NUM = 1000
println(@time fibNUMdigits(NUM))

# answer: 4782
# 0.158834 seconds (2.42 M allocations: 269.489 MiB, 13.27% gc time)
