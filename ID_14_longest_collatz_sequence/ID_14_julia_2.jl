function len_collatz(num)
    len = 1
    while num != 1
        len += 1
        if iseven(num)
            num /= 2
        else
            num = 3 * num + 1
        end
    end
    len
end


function main(limit)
    found = (1, len_collatz(1))
    for i in 2:limit
        collatz = len_collatz(i)
        if collatz > found[2]
            found = (i, collatz)
        end
    end
    found
end


println(@time main(1_000_000))

# answer: 525
# 0.504942 seconds
