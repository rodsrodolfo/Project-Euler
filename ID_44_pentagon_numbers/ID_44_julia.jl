function pentagonal(n::Int64)::Int64
    return n * (3 * n - 1) / 2
end

function isPentagonal(num::Int64)::Bool
    isinteger((1 + √(1 + 24 * num)) / 6) && return true
    return false
end

function sumAndDifferenceArePentagonal(a::Int64, b::Int64)::Bool
    isPentagonal(a + b) && isPentagonal(abs(a - b)) && return true
    return false
end

function firstPentagonals(num::Int64)::Vector{Int64}
    pentagonals = Int64[]
    while length(pentagonals) < num
        push!(pentagonals, pentagonal(length(pentagonals) + 1))
    end
    return pentagonals
end

function findD()
    pentagonals = firstPentagonals(2)
    while true
        for pentagonal in pentagonals[1:end-1]
            i = pentagonal
            j = pentagonals[end]
            if sumAndDifferenceArePentagonal(i, j)
                return (i, j, j - i)
            end
        end
        push!(pentagonals, pentagonal(length(pentagonals) + 1))
    end
end

println(@time findD())

# answer: 5482660
