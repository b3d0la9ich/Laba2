function countEqualNumbers(sequence) {
    let count = 0;
    for (let i = 1; i < sequence.length; i++) {
        if (sequence[i] === sequence[i - 1]) {
            count++;
        }
    }
    return count;
}

let sequence = [5, 12, 12, 23, 23, 23, 108];
let result = countEqualNumbers(sequence);
console.log("Output: " + result);

