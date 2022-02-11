isPentagonal(P::Int64)::Bool = isinteger((1 + √(1 + 24 * P)) / 6) ? true : false


hexagonal(n::Int64)::Int64 = n * (2 * n - 1)


hIndex(num::Int64)::Int64 = Int((1 + √(1 + 8 * num)) / 4)


function findNextTPH(n::Int64)::Int64
    index = hIndex(n) + 1
    num = hexagonal(index)
    while !isPentagonal(num) # all hexagonal are triangular, so generate H and check if is P
        index += 1
        num = hexagonal(index)
    end
    return num
end


const NUM = 40755
println(@time findNextTPH(NUM))

# answer: 1533776805
# 0.000084 seconds
