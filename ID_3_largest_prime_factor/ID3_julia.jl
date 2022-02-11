#= The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ? =#

function largestPrimeFactor(num)
    largestPrimeFactor = 0
    counter = 2
    while counter^2 < num
        if num % counter == 0
            # println("$counter devides $num")
            num /= counter
            largestPrimeFactor = counter
        else
            # println("$counter doesn't devide $num")
            counter == 2 ? counter += 1 : counter += 2
        end
    end
    num > largestPrimeFactor ? (return num) : (return largestPrimeFactor)
end

println(@time largestPrimeFactor(600851475143))

# answer: 6857
# 0.000075 seconds
