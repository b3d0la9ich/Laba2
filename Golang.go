package main

import "fmt"

func countEqualNumbers(sequence []int) int {
	count := 0
	for i := 1; i < len(sequence); i++ {
		if sequence[i] == sequence[i-1] {
			count++
		}
	}
	return count
}

func main() {
	sequence := []int{5, 12, 12, 23, 23, 23, 108}
	result := countEqualNumbers(sequence)
	fmt.Println("Output:", result)
}

