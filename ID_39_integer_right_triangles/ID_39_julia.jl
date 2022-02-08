function hipotenuse(a::Int64, b::Int64)::Float64
    return √(a^2 + b^2)
end

function perimeter(a::Int64, b::Int64, c::Float64)::Float64
    return a + b + c
end

function answer(num::Int64)::Int64
    solutions = zeros(Int, num)
    for a = 1:num÷2, b = 1:a
        c = hipotenuse(a, b)
        p = perimeter(a, b, c)
        if isinteger(p) && p <= num
            solutions[Int(p)] += 1
        end
    end
    return findmax(solutions)[2]
end

const NUM = 1000
println(@time answer(NUM))

# answer: 840
