#= What is the sum of the digits of the number 2^1000? =#

function sumOfDigitsNumToPower(num, power)
    digits = [0, num]
    for i in 2:power

        remainder = 0*digits
        for j in 0:length(digits)-2
            current = digits[end-j] * num
            digits[end-j] = current % 10
            remainder[end-j-1] += current ÷ 10
        end

        digits += remainder

        if digits[begin] != 0
            pushfirst!(digits, 0)
        end
    end
    return sum(digits)
end

println(sumOfDigitsNumToPower(2, 1000))

# answer: 1366
