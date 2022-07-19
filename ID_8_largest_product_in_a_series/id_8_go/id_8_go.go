package main

import (
	"fmt"
	"log"
	"os"
	"strings"
)

const FILENAME = "../id_8_rust/ID_8_source.txt"
const LENGTH = 13

func main() {
	a := sequenceProduct(readNumberStr(FILENAME)[0:3])
	fmt.Printf("%d\n", a)
	fmt.Printf("%d\n", int([]rune("1")[0]))
}

func readNumberStr(filename string) []rune {
	content, err := os.ReadFile(filename)
	if err != nil {
		log.Fatal(err)
	}
	number := strings.ReplaceAll(string(content), "\n", "")
	return []rune(number)
}

func sequenceProduct(sequence []rune) int {
	product := 1
	for _, v := range []rune(sequence) {
		product *= int(v)
	}
	return product
}

// func findGreatestSequenceProduct(sequence string, length int) int {
// 	largestProduct := 0
// 	for
// }
