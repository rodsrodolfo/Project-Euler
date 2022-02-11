function triangleN(num::Int64)::Int64
    return (num * (num + 1)) / 2
end

function wordToNumber(word::String)::Int64
    asciiA = Int('A')
    asciiWord = 0
    for char in word
        asciiWord += Int(char) - asciiA + 1
    end
    return asciiWord
end

function wordsFromFile(path::String)::Vector{String}
    return map((word) -> String(word[2:end-1]), split(readline(path), ","))
end

function howManyTriangularWords(words::Vector{String})::Int64
    triangularNums = [triangleN(1)]
    triangularCounts = 0
    for word in words
        wordNum = wordToNumber(word)
        while triangularNums[end] < wordNum
            push!(triangularNums, triangleN(length(triangularNums) + 1))
        end
        wordNum in triangularNums && (triangularCounts += 1)
    end
    return triangularCounts
end

const PATH = "/home/mateus/Documents/Coding/Project Euler/ID_42_coded_triangle_numbers/ID_42_source.txt"
println(@time howManyTriangularWords(wordsFromFile(PATH)))

# answer: 162
# 0.005637 seconds (1.81 k allocations: 168.525 KiB)
