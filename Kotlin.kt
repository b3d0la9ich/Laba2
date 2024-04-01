import kotlin.collections.ArrayList

fun countEqualNumbers(sequence: ArrayList<Int>): Int {
    var count = 0
    for (i in 1 until sequence.size) {
        if (sequence[i] == sequence[i - 1]) {
            count++
        }
    }
    return count
}

fun main() {
    val sequence = arrayListOf(5, 12, 12, 23, 23, 23, 108)
    val result = countEqualNumbers(sequence)
    println("Output: $result")
}

