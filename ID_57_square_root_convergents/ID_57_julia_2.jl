function main()
    count = 0
    num, den = big(1), 2

    for _ in 1:1000
        if ndigits(num + den) > ndigits(den)
            count += 1
        end

        num, den = den, 2 * den + num
    end

    count
end

println(@time main())