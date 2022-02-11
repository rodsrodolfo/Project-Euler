using Primes

smush(a, b) = a * 10^(ndigits(b)) + b
test2(a, b) = a != b && isprime(smush(a, b)) && isprime(smush(b, a))
# suffixed underscore assumes that previous tests have passed, so only
# test the new prime combos
test3_(a, b, c) = test2(b, c) && test2(a, c)
test4_(a, b, c, d) = test2(a, d) && test2(b, d) && test2(c, d)
test5_(a, b, c, d, e) = test2(a, e) && test2(b, e) && test2(c, e) && test2(d, e)

function p60()
    P = primes(10_000)
    N = length(P)
    for i ∈ 1:N, j ∈ i+1:N
        test2(P[i], P[j]) || continue
        for k ∈ j+1:N
            test3_(P[i], P[j], P[k]) || continue
            for l ∈ k+1:N
                test4_(P[i], P[j], P[k], P[l]) || continue
                for m ∈ l+1:N
                    test5_(P[i], P[j], P[k], P[l], P[m]) || continue
                    println("$(P[i]) $(P[j]) $(P[k]) $(P[l]) $(P[m])")
                    return  P[i] + P[j] + P[k] + P[l] + P[m]
                end
            end
        end
    end
end

println(@time p60())

# answer: 26033
# 0.321989 seconds (476.69 k allocations: 11.335 MiB, 33.41% compilation time)