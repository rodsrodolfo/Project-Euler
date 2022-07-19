package main

import (
	"fmt"
	"math"
)

const NTH = 10_001

func main() {
	fmt.Printf("%d\n", nthPrime(NTH))
}

func isPrime(num int) bool {
	limit := int(math.Sqrt(float64(num)))
	for i := 2; i <= limit; i++ {
		if num%i == 0 {
			return false
		}
	}
	return true
}

func nthPrime(nth int) int {
	count := 1
	num := 1
	for count < nth {
		num += 2
		if isPrime(num) {
			count += 1
		}
	}
	return num
}
