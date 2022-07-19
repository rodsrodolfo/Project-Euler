package main

import (
	"fmt"
)

func main() {
	var longest = [2]int{1, len_collatz(1)}
	var len int

	for i := 2; i < 1_000_000; i++ {
		len = len_collatz(i)
		if len > longest[1] {
			longest[0], longest[1] = i, len
		}
	}

	fmt.Println(longest)
}

func len_collatz(num int) int {
	var len int = 1
	for num != 1 {
		len += 1
		if num%2 == 0 {
			num = num / 2
		} else {
			num = 3*num + 1
		}
	}
	return len
}
