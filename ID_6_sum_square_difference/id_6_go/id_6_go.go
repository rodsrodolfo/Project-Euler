package main

import (
	"fmt"
)

const LIMIT = 100

func main() {
	fmt.Printf("%d\n", squareSum(LIMIT)-sumSquares(LIMIT))
}

func sumSquares(limit int) int {
	sum := 0
	for i := 1; i <= limit; i++ {
		sum += i * i
	}
	return sum
}

func squareSum(limit int) int {
	sum := 0
	for i := 1; i <= limit; i++ {
		sum += i
	}
	return sum * sum
}
