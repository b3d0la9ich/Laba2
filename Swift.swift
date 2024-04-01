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

var sequence = [5, 12, 12, 23, 23, 23, 108]
let result = countEqualNumbers(sequence: sequence)
print("Output: \(result)")

