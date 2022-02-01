function d(n::Int64)::Int64
    dn = 0
    for i in 1 : n ÷ 2
        if n % i ==0
            dn += i
        end
    end
    return dn
end

function listAbundantsBelow(num::Int64)::Vector{Int64}
    listAbundants = Int64[]
    for i in 1:num-1
        if d(i) > i
            push!(listAbundants, i)
        end
    end
    return listAbundants
end

function possibleSumTwoAbunBelow(num::Int64)::Vector{Int64}
    abundants = listAbundantsBelow(num)
    combinations = Int64[]
    for i in 1:length(abundants)
        for j in i:length(abundants)
            sumAbundants = abundants[i]+abundants[j]
            if sumAbundants < num
                push!(combinations, sumAbundants)
            end
        end
    end
    return combinations
end

function notPossibleCombinationBelow(num::Int64)::Vector{Int64}
    abundants = listAbundantsBelow(num)
    notPossible = [1:num-1...]
    for i in 1:length(abundants)
        for j in i:length(abundants)
            sumAbundants = abundants[i]+abundants[j]
            sumAbundants< num && filter!(e->e!=sumAbundants, notPossible)
        end
    end
    return notPossible
end

const NUM = 28123

println(@time sum(notPossibleCombinationBelow(NUM)))

# answer: 4179871
