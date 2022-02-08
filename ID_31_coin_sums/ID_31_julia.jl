function howManyWays(pennies::Int64)::Int64
    found = 0
    for a in 0:pennies÷200
        for b in 0:pennies÷100
            for c in 0:pennies÷50
                for d in 0:pennies÷20
                    for e in 0:pennies÷10
                        for f in 0:pennies÷5
                            for g in 0:pennies÷2
                                for h in 0:pennies÷1
                                    (200 * a + 100 * b + 50 * c + 20 * d + 10 * e + 5 * f + 2 * g + h) == pennies && (found += 1)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return found
end

const PENNIES = 200
println(@time howManyWays(PENNIES))

# answer: 73682
