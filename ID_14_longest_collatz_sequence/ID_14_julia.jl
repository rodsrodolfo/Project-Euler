function collatz(num::Int64)
    originalNum = num
    stepsCount = 0
    while num != 1
        num % 2 == 0 ? num /= 2 : num = 3*num + 1
        stepsCount += 1
    end
    return Dict{String, Int64}("num" => originalNum, "steps" => stepsCount)
end

function findLongestCollatz(num::Int64)
    longest = Dict{String, Int64}("steps" => 0)
    for i in 1:num
        current = collatz(i)
        if longest["steps"] < current["steps"]
            longest = current
        end
    end
    return longest::Dict{String, Int64}
end

num = 999999

println(findLongestCollatz(num))

# answer: 837799
