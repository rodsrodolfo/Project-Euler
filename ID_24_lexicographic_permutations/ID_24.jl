using Combinatorics

# println(@time join(collect(permutations(0:9))[10^6]))

function nthPermutation(range::UnitRange{Int64}, n::Int64)::String
    permutationsIterable = permutations(range)
    index = 1
    for permutation in permutationsIterable
        index == n && return join(permutation)
        index += 1
    end
end

const RANGE = 0:9
const NTH = 1000000
println(@time nthPermutation(RANGE, NTH))

# answer: 2783915460
