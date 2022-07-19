package main

import (
	"fmt"
	"math"
)

const NUM int = 2_000_000

func main() {
	sum := 2
	for i := 3; i < NUM; i += 2 {
		if IsPrime(i) {
			sum += i
		}
	}
	fmt.Println(sum)
}

func IsPrime(num int) bool {
	limit := int(math.Sqrt(float64(num)))
	for i := 2; i <= limit; i++ {
		if num%i == 0 {
			return false
		}
	}
	return true
}
