function sumDiagonalsSpiral(side)
    sumDiagonals = 1
    for i in 3:2:side, j in 0:3
        sumDiagonals += i^2 - (i - 1) * j
    end
    return sumDiagonals
end

const SIDE = 1001
println(@time sumDiagonalsSpiral(SIDE))

# answer: 669171001
# 0.000001 seconds
