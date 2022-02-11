function isTripletPandigital(a::Int64, b::Int64, c::Int64)::Bool
    digitsAll = vcat(digits(a), digits(b), digits(c))
    sort(digitsAll) != 1:9 && return false
    return true
end

function potentialPandigital(A, B)
    digitsAll = vcat(digits(A), digits(B))
    digitsAll != unique(digitsAll) && return false
    return true
end

function sumPandigitalProducts()
    foundPandigital = Int64[]
    for i in 2:987, j in 123456789÷10^(9-(9-ndigits(i))÷2):987654321÷10^(9-(9-ndigits(i))÷2)
        if potentialPandigital(i, j)
            product = i * j
            if !(product in foundPandigital) && isTripletPandigital(i, j, product)
                push!(foundPandigital, product)
                # println(i, " ", j, " ", product)
            end
        end
    end
    return sum(foundPandigital)
end

println(@time sumPandigitalProducts())

# answer: 45228
# 0.509695 seconds (9.06 M allocations: 799.436 MiB, 5.68% gc time)
