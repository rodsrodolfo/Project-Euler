package main

import "fmt"

const UNTIL = 20

func main() {
	found := 20
	for !isDivisible(found) {
		found++
	}
	fmt.Println(found)
}

func isDivisible(num int) bool {
	for i := 2; i <= UNTIL; i++ {
		if num%i != 0 {
			return false
		}
	}
	return true
}
