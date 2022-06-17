using DelimitedFiles
using Combinatorics

function decrypt(sequence::Vector{Int64}, key::Vector{Int64})
    len_sequence = length(sequence)
    len_key = length(key)
    decrypted = []
    for i in 1:len_sequence
        push!(decrypted, Char(xor(sequence[i], key[i % len_key == 0 ? len_key : i % len_key])))
    end
    return join(decrypted)
end

function possibleKeys()
    a = Int('a')
    z = Int('z')
    i = vcat(a:z, a:z, a:z)
    return combinations(i, 3)
end

function findSumText(sequence,possible_keys)
    for k in possible_keys
        message = decrypt(sequence, k)
        if occursin(" and ", message)
            return sum(Int.([char for char in message]))
        end
    end
end

function convertInput(path)
    return parse.(Int,split(readlines(path)[1],","))
end

const PATH = "/home/mrodolfo/Documents/Cloned_repositories/Project-Euler/ID_59_XOR_decryption/ID_59_source.txt"
println(@time findSumText(convertInput(PATH),possibleKeys()))

# answer: 129448
# 0.685704 seconds (218.20 k allocations: 305.798 MiB, 2.28% gc time, 1.19% compilation time)
