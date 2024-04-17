package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

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
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter the number of elements: ")
    n, _ := reader.ReadString('\n')
    n = strings.TrimSpace(n)
    numElements, err := strconv.Atoi(n)
    if err != nil {
        fmt.Println("Error: Invalid input. Please enter an integer.")
        return
    }

    sequence := make([]int, numElements)
    fmt.Println("Enter the elements: ")
    for i := 0; i < numElements; i++ {
        input, _ := reader.ReadString('\n')
        input = strings.TrimSpace(input)
        num, err := strconv.Atoi(input)
        if err != nil {
            fmt.Println("Error: Invalid input. Please enter integers only.")
            return
        }
        sequence[i] = num
    }

    result := countEqualNumbers(sequence)
    fmt.Println("Output:", result)
}
