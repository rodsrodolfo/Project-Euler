function findMaxSum(num::Int64)::Int64
    return maximum(map((x)->sum(digits(x)),[BigInt(a)^b for a in 1:num for b in 1:num]))
end

const NUM = 99
println(@time findMaxSum(NUM))

# answer: 972
# 0.059648 seconds (134.03 k allocations: 12.056 MiB, 74.67% compilation time)
