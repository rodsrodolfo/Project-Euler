#= 
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ? 
=#

function largest_prime_factor(num::Int64)
    i::Int64 = 2
    curr::Int64 = num
    largest::Int64 = 0
    while i <= num
        if curr % i == 0
            largest = i
            while curr % i == 0
                curr /= i
            end
        end
        i += 1
    end
    return curr < num ? num : largest
end

println(@time largest_prime_factor(10))

# answer:
