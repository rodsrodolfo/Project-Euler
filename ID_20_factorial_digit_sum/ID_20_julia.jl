const NUM = 100
println(@time sum(digits(factorial(big(NUM)))))

# answer: 648
# 0.012111 seconds (265 allocations: 14.500 KiB, 99.49% compilation time)
