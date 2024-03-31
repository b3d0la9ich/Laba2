fun countSafeStones(stones: Int, birds: List<Int>): Int {
    val isStoneSafe = BooleanArray(stones + 1) { true } // initialize all stones as safe

    for (bird in birds) {
        // if a bird can fly a distance that is less than or equal to the number of stones,
        // that it will visit the stones with a step "bird"
        var i = bird
        while (i <= stones) {
            isStoneSafe[i] = false // mark stone as unsafe
            i += bird
        }
    }

    val safeStones = isStoneSafe.count { it } - 1 // subtract 1 for 0-index

    return safeStones
}

fun main() {
    val stones = 6
    val birds = listOf(3, 2)

    val safeStones = countSafeStones(stones, birds)
    println("Count of safe stones: $safeStones")
}