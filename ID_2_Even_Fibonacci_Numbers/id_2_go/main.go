package main

import "fmt"

const LIMIT int = 4_000_000

func main() {
	sum := 0
	fib_1, fib_2 := 1, 1
	for fib_2 < LIMIT {
		if fib_2%2 == 0 {
			sum += fib_2
		}
		fib_1, fib_2 = fib_2, fib_1+fib_2
	}
	fmt.Println(sum)
}
