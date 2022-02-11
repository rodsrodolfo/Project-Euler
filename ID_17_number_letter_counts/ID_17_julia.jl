function howManyLettersNum(num::Int64)::Int64
    bank20 = Dict(
        0 => length(""),
        1 => length("one"),
        2 => length("two"),
        3 => length("three"),
        4 => length("four"),
        5 => length("five"),
        6 => length("six"),
        7 => length("seven"),
        8 => length("eight"),
        9 => length("nine"),
        10 => length("ten"),
        11 => length("eleven"),
        12 => length("twelve"),
        13 => length("thirteen"),
        14 => length("fourteen"),
        15 => length("fifteen"),
        16 => length("sixteen"),
        17 => length("seventeen"),
        18 => length("eighteen"),
        19 => length("nineteen")
    )
    bank100 = Dict(
        2 => length("twenty"),
        3 => length("thirty"),
        4 => length("forty"),
        5 => length("fifty"),
        6 => length("sixty"),
        7 => length("seventy"),
        8 => length("eighty"),
        9 => length("ninety")
    )
    hundred = length("hundred")
    and = length("and")
    one = length("one")
    thousand = length("thousand")

    num < 20 && return bank20[num]
    num < 100 && return bank100[num÷10] + howManyLettersNum(num % 10)
    num < 1000 && return bank20[num÷100] + hundred + (howManyLettersNum(num % 100) == 0 ? 0 : and) + howManyLettersNum(num % 100)
    num == 1000 && return one + thousand
end

function sumNumsToLetter(range::UnitRange{Int64})::Int64
    return sum(map(howManyLettersNum, range))
end

const RANGE = 1:1000
println(@time sumNumsToLetter(RANGE))

# answer: 21124
# 0.006643 seconds (47.52 k allocations: 10.423 MiB)
