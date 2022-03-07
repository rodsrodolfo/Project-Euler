#= The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million. =#

using Primes

println(@time sum(filter(isprime,3:2:2000000-1))+2)

# answer: 142913828922
# 0.500120 seconds
