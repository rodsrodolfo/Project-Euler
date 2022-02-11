function d(n)
    dn = 0
    for i in 1:n÷2
        if n % i == 0
            dn += i
        end
    end
    return dn
end

function sumAmicableUnder(num)
    sumAmicable = 0
    for i in 1:num
        di = d(i)
        if di != i && d(di) == i
            sumAmicable += i
        end
    end
    return (sumAmicable)
end

const NUM = 10000

println(@time sumAmicableUnder(NUM))

# answer: 31626
# 0.180566 seconds
