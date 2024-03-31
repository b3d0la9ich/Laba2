package main

import (
	"fmt"
)

func countSafeStones(stones int, birds []int) int {
	isStoneSafe := make([]bool, stones+1) // initialize all stones as safe
	for i := range isStoneSafe {
		isStoneSafe[i] = true
	}

	for _, bird := range birds {
		// if a bird can fly a distance that is less than or equal to the number of stones,
		// that it will visit the stones with a step "bird"
		for i := bird; i <= stones; i += bird {
			isStoneSafe[i] = false // mark stone as unsafe
		}
	}

	safeStones := 0
	for i := 1; i <= stones; i++ {
		if isStoneSafe[i] {
			safeStones++ // add counts of safe stones
		}
	}

	return safeStones
}

func main() {
	stones := 6
	birds := []int{3, 2}

	safeStones := countSafeStones(stones, birds)
	fmt.Println("Count of safe stones:", safeStones)
}