import Foundation

func countSafeStones(stones: Int, birds: [Int]) -> Int {
    var isStoneSafe = [Bool](repeating: true, count: stones + 1) // initialize all stones as safe

    for bird in birds {
        // if a bird can fly a distance that is less than or equal to the number of stones,
        // that it will visit the stones with a step "bird"
        var i = bird
        while i <= stones {
            isStoneSafe[i] = false // mark stone as unsafe
            i += bird
        }
    }

    let safeStones = isStoneSafe.filter { $0 }.count - 1 // subtract 1 for 0-index

    return safeStones
}

func main() {
    let stones = 6
    let birds = [3, 2]

    let safeStones = countSafeStones(stones: stones, birds: birds)
    print("Count of safe stones: \(safeStones)")
}

main()