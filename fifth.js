function countSafeStones(stones, birds) {
    let isStoneSafe = new Array(stones + 1).fill(true); // initialize all stones as safe

    for (let bird of birds) {
        // if a bird can fly a distance that is less than or equal to the number of stones,
        // that it will visit the stones with a step "bird"
        for (let i = bird; i <= stones; i += bird) {
            isStoneSafe[i] = false; // mark stone as unsafe
        }
    }

    let safeStones = isStoneSafe.filter(Boolean).length - 1; // subtract 1 for 0-index

    return safeStones;
}

function main() {
    let stones = 6;
    let birds = [3, 2];

    let safeStones = countSafeStones(stones, birds);
    console.log("Count of safe stones: " + safeStones);
}

main();