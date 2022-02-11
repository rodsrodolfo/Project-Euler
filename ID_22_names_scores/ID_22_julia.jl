function namesFromFile(path::String)::Vector{String}
    return String.(split(readline(path)[2:end-1], "\",\""))
end

function alphabeticalValueName(name::String)::Int64
    A = Int('A') - 1
    value = 0
    for char in name
        value += Int(char) - A
    end
    return value
end

function sumNameScore(path::String)::Int64
    names = sort(namesFromFile(path))
    values = map(alphabeticalValueName, names)
    scores = map((pair) -> prod(pair), enumerate(values))
    return sum(scores)
end

const PATH = "/home/mateus/Documents/Coding/Project Euler/ID_22_names_scores/ID_22_source.txt"
println(@time sumNameScore(PATH))

# answer: 871198282
# 0.007266 seconds (15.52 k allocations: 1.456 MiB)
