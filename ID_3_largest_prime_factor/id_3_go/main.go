package main

import (
	"fmt"
	"math"
)

const NUM int = 600851475143

func main() {
	result := largest_prime_factor(NUM)
	fmt.Println(result)
}

func largest_prime_factor(num int) int {
	limit := int(math.Sqrt(float64(num)))
	var largest int
	for i := 2; i <= limit; i++ {
		if num%i == 0 {
			largest = i
			for num%i == 0 {
				num /= i
			}
		}
	}
	if largest < num {
		return num
	} else {
		return largest
	}
}
