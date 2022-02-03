function findDenominatorProductDigitsCancelling()
    prodFractionsFound = 1 // 1
    for nume in filter((x) -> x % 10 != 0, 11:99)
        first = nume ÷ 10
        second = nume % 10
        for i in first+1:9
            nume // (10 * i + first) == second // i && (prodFractionsFound *= nume // (10 * i + first))
            nume // (10 * i + second) == first // i && (prodFractionsFound *= nume // (10 * i + second))
        end
        for i in second+1:9
            nume // (first * 10 + i) == second // i && (prodFractionsFound *= nume // (first * 10 + i))
        end
        if second > first
            for i in 1:9
                nume // (second * 10 + i) == first // i && (prodFractionsFound *= nume // (second * 10 + i))
            end
        end
    end
    return prodFractionsFound
end

println(@time denominator(findDenominatorProductDigitsCancelling()))

# answer: 100
