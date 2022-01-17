#= A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc. =#

function findTripletProduct(num)
    for i in 1:num
        for j in i+1:num
            for k in j+1:num
                if i + j + k == num && i^2 + j^2 == k^2
                    return i*j*k
                end
            end
        end
    end
end

println(findTripletProduct(10000))

# answer: 31875000