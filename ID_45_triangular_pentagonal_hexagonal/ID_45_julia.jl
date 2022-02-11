# function triangular(n::Int64)::Int64
#     return (n * (n + 1)) / 2
# end


# function isTriangular(T::Int64)::Bool
#     return isinteger((-1 + √(1 + 8 * T)) / 2) ? true : false
# end


# function pentagonal(n::Int64)::Int64
#     return n * (3 * n - 1) / 2
# end


function isPentagonal(P::Int64)::Bool
    return isinteger((1 + √(1 + 24 * P)) / 6) ? true : false
end


function hexagonal(n::Int64)::Int64
    return n * (2 * n - 1)
end


# function isHexagonal(H::Int64)::Bool
#     return isinteger((1 + √(1 + 8 * H)) / 4) ? true : false
# end


function nextHexagonal(H::Int64)::Int64
    return hexagonal(Int((1 + √(1 + 8 * H)) / 4) + 1)
end


function findNextTPH(n::Int64)::Int64
    num = nextHexagonal(n)
    while !isPentagonal(num) # all hexagonal are triangular, so generate H and check if is P
        num = nextHexagonal(num)
    end
    return num
end


const NUM = 40755
println(@time findNextTPH(NUM))

# answer: 1533776805
# 0.000396 seconds
