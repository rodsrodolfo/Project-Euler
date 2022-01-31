#= What is the 10001st prime number? =#

function isPrime(num)
    for i in 2:trunc(Int, √num)
        if num % i == 0
            return false
        end
    end
    return true
end

num = 10001
test = 3
found = 1

@time while found < num
    if isPrime(test)
        global found += 1
    end
    global test += 2
end

println("$(num)st prime is $(test - 2)")

# answer: 104743