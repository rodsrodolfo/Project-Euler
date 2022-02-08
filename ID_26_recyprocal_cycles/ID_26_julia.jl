function cycleSize(num::Int64)::Int64
    size = 0
    remainder = 10 % num
    remainder == 0 && return 0
    remainders = Int64[remainder]
    while true
        size += 1
        remainder = (remainder * 10) % num
        (remainder in remainders || remainder == 0) && return size
        push!(remainders, remainder)
    end
end

function largestCycle(num::Int64)::Tuple{Int64,Int64}
    largest = 0
    found = 1
    for i in 1:num
        currCycle = cycleSize(i)
        if currCycle > largest
            largest = currCycle
            found = i
        end
    end
    return found, largest
end

const NUM = 999
found, largest = @time largestCycle(NUM)
println("number: 1/$(found)\ncycle size: $(largest)")

# answer: 983
