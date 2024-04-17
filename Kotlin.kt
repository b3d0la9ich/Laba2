import java.util.Scanner

fun countEqualNumbers(sequence: List<Int>): Int {
    var count = 0
    for (i in 1 until sequence.size) {
        if (sequence[i] == sequence[i - 1]) {
            count++
        }
    }
    return count
}

fun main() {
    val scanner = Scanner(System.`in`)
    print("Enter the number of elements: ")
    val n = scanner.nextInt()

    println("Enter the elements: ")
    val sequence = mutableListOf<Int>()
    for (i in 0 until n) {
        sequence.add(scanner.nextInt())
    }

    val result = countEqualNumbers(sequence)
    println("Output: $result")
}
