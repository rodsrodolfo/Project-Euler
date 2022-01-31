function fileToDigitMatrix(path)
    matrixDigitString = split.(readlines(path),"")
    return [parse(Int, line[i]) for line in matrixDigitString, i in 1:length(matrixDigitString[1])]
end

function largeSum(path)
    matrixDigitsInt = fileToDigitMatrix(path)
    result = ""
    remainder = 0

    for i in size(matrixDigitsInt)[2]:-1:1
        partialSum = remainder + sum(matrixDigitsInt[:, i])
        result = string(partialSum % 10) * result
        remainder = partialSum ÷ 10    
    end
    return string(remainder) * result
end

filePath = "/home/mateus/Documents/Coding/Project Euler/ID_13_large_sum/ID_13_source.txt"

println(@time largeSum(filePath)[1:10])

# answer: 5537376230
