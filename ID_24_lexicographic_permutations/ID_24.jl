using Combinatorics

println(@time join(string.(collect(permutations(collect(0:9)))[10^6])))

# answer: 2783915460
