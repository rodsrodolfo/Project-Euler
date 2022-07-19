package main

import "fmt"

const LIMIT = 999

func main() {
	fmt.Println(largestPalindromeMultiplication(LIMIT))
}

func isPalindrome(num int) bool {
	num_str := fmt.Sprint(num)
	len_num := len(num_str)
	limit := len_num / 2
	for i := 0; i < limit; i++ {
		if num_str[i] != num_str[len_num-i-1] {
			return false
		}
	}
	return true
}

func largestPalindromeMultiplication(limit int) int {
	var ij int
	largest := 0
	for i := 1; i <= limit; i++ {
		for j := i + 1; j <= limit; j++ {
			ij = i * j
			if ij > largest {
				if isPalindrome(ij) {
					largest = ij
				}
			}
		}
	}
	return largest
}
