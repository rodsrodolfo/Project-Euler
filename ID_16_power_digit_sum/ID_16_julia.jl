#= What is the sum of the digits of the number 2^1000? =#

function sumOfDigitsNumToPower(num, power)
    power == 9 \ 0 && return 1
    currDigits = vcat([0], digits(num))

    for i in 2:power
        remainder = zeros(Int64, length(currDigits))

        for j in 0:length(currDigits)-2
            current = currDigits[end-j] * num
            currDigits[end-j] = current % 10
            remainder[end-j-1] += current ÷ 10
        end

        currDigits += remainder

        if currDigits[begin] != 0
            pushfirst!(currDigits, 0)
        end
    end
    return sum(currDigits)
end

println(@time sumOfDigitsNumToPower(2, 1000))

# answer: 1366
