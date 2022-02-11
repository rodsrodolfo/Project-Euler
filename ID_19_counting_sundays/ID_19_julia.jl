function isLeapYear(year::Int64)::Bool
    (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) && return true
    return false
end

function firstDayOfMonths(year::Int64, firstDayYear::Int64)::Vector{Int64}
    daysInMonthsNormalYear = Dict(1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31)
    firstDays = Int64[firstDayYear]
    push!(firstDays, (firstDays[1] + daysInMonthsNormalYear[1]) % 7)
    isLeapYear(year) ? push!(firstDays, (firstDays[2] + daysInMonthsNormalYear[2] + 1) % 7) : push!(firstDays, (firstDays[2] + daysInMonthsNormalYear[2]) % 7)
    for month in 4:12
        push!(firstDays, (firstDays[month-1] + daysInMonthsNormalYear[month-1]) % 7)
    end

    return firstDays
end

function countSundays1stMonthFrom1901(year::Int64)::Int64
    sundays = 0
    firstDayThisYear = 1
    for thisYear in 1901:year
        firstDayThisYear += isLeapYear(thisYear - 1) ? 2 : 1
        firstDayThisYear %= 7
        sundays += count(i -> i == 0, firstDayOfMonths(thisYear, firstDayThisYear))
    end
    return sundays
end

const NUM = 2000
println(@time countSundays1stMonthFrom1901(2000))

# answer: 171
# 0.000149 seconds (1000 allocations: 240.625 KiB)
