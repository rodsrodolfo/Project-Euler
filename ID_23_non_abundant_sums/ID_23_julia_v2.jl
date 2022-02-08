function isAbundant(j::Int64)::Bool
    divisors = 0
    for n in 2:√j÷1
        if j % n == 0
            divisors += n
            if n < j / n
                divisors += j / n
            end
            j <= divisors && return true
        end
    end
    return j <= divisors
end

function answer(max)::Int64
    abundant = Int64[]
    checked = zeros(Int,max)
    total = 0
    for n in 1:max
        if isAbundant(n)
            push!(abundant, n)
        end 
    end
    count = length(abundant)
    for a in 1:count, b in a:count
        currSum  = abundant[a]+abundant[b]
        if currSum <= max
            checked[currSum] = 1
        end
    end
    for n in 1:max
        if checked[n] == 0
            total += n
        end
    end
    return total
end

const MAX = 28123
println(@time answer(MAX))

# answer: 4179871
