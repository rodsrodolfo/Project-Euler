function countAbove(n::Int64,limit::Int64)::Int64
    for i in 1:n÷2
        if binomial(n, i) > limit
            if iseven(n)
                return (n ÷ 2 - i) * 2 + 1
            else
                return (n ÷ 2 - i + 1) * 2
            end
        end
    end
    return 0
end

function countAllAbove(range::UnitRange{Int64},limit::Int64)::Int64
    return sum(map((x)->countAbove(x,limit),range))
end

println(@time countAllAbove(1:100,1_000_000))

# answer: 4075
# 0.000030 seconds (1 allocation: 896 bytes)
