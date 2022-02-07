function hipotenuse(a::Int64, b::Int64)::Float64
    return √(a^2 + b^2)
end

function perimeter(a::Int64, b::Int64, c::Float64)::Float64
    return a + b + c
end

function isInt(num::Float64)::Bool
    num == num ÷ 1 && return true
    return false
end

function numberSolutions(p::Int64)::Int64
    number = 0
    for a in 1:p, b in 1:a
        hip = hipotenuse(a, b)
        isInt(hip) && perimeter(a, b, hip) == p && (number += 1)
    end
    return number
end

function maximizeSolutionsUnder(num::Int64)::Tuple{Int64, Int64}
    maxFound = (0, 0)
    for p in 1:num
        sol = numberSolutions(p)
        sol > maxFound[1] && (maxFound = (sol, p))
    end
    return maxFound
end

const NUM = 1000
println(@time maximizeSolutionsUnder(NUM))

# answer: 840
