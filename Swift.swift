import Foundation

func countEqualNumbers(sequence: [Int]) -> Int {
    var count = 0
    for i in 1..<sequence.count {
        if sequence[i] == sequence[i - 1] {
            count += 1
        }
    }
    return count
}

func main() {
    print("Enter the number of elements: ")
    guard let n = Int(readLine()!), n > 0 else {
        print("Error: Invalid input. Please enter a positive integer.")
        return
    }

    var sequence = [Int]()
    print("Enter the elements: ")
    for _ in 0..<n {
        guard let element = Int(readLine()!), element >= 0 else {
            print("Error: Invalid input. Please enter non-negative integers only.")
            return
        }
        sequence.append(element)
    }

    let result = countEqualNumbers(sequence: sequence)
    print("Output: \(result)")
}

main()   
