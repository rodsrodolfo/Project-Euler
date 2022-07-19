package main

import "fmt"

const LIMIT int = 1000

func main() {
	answer := sum_3_5(LIMIT)
	fmt.Println(answer)
}

func sum_3_5(limit int) int {
	sum := 0
	for i := 1; i < limit; i++ {
		if i%3 == 0 || i%5 == 0 {
			sum += i
		}
	}
	return sum
}
