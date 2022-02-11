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
# 0.163779 seconds (3.01 M allocations: 305.559 MiB, 12.04% gc time, 10.36% compilation time)
