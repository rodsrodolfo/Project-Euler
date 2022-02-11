function answer()
    totalDigits = 1
    curr = 1
    product = 1
    for i in 0:6
        currPower = 10^i
        while totalDigits < currPower
            curr += 1
            totalDigits += ndigits(curr)
        end
        product *= reverse(digits(curr))[end-totalDigits+currPower]
    end
    return product
end

println(@time answer())

# answer: 210
# 0.001096 seconds (14 allocations: 1.188 KiB)
