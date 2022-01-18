function collatz(num)
    originalNum = num
    stepsCount = 0
    while num != 1
        num % 2 == 0 ? num /= 2 : num = 3*num + 1
        stepsCount += 1
    end
    return Dict("num" => originalNum, "steps" => stepsCount)
end

function findLongestCollatz(num)
    longest = Dict("steps" => 0)
    for i in 1:num
        current = collatz(i)
        if longest["steps"] < current["steps"]
            longest = current
        end
    end
    return longest
end

num = 999999

println(findLongestCollatz(num))

# answer: 837799
