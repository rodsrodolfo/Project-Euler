function fraction_recursive(depth::Int64)
    if depth == 1
        convert(Rational{BigInt}, 1 // 2)
    else
        1 // (2 + fraction_recursive(depth - 1))
    end
end


function sqrt_2(depth::Int64)
    1 + fraction_recursive(depth)
end


function nom_more_digits_den(rational)
    if ndigits(numerator(rational)) > ndigits(denominator(rational))
        true
    else
        false
    end
end


function main(n_expansions)
    count(i -> nom_more_digits_den(i), sqrt_2.(1:n_expansions))
end


println(@time main(1_000))


# answer: 153
# 0.807391 seconds (9.46 M allocations: 257.961 MiB, 41.05% gc time)
