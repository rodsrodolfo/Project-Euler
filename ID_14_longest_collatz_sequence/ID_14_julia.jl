L = 10^6

function collatz(n)
    counter = 1
    while n != 1
        counter += 1
        iseven(n) ? n ÷= 2 : n = 3 * n + 1
    end
    return counter
end

println(@time findmax(map(collatz, 1:L)))

# answer: 837799
# 0.345226 seconds (153.08 k allocations: 16.401 MiB, 15.20% compilation time)
