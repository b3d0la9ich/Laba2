fn count_safe_stones(stones: usize, birds: &Vec<usize>) -> usize {
    let mut is_stone_safe = vec![true; stones]; // initialize all stones as safe

    for &bird in birds {
        // if a bird can fly a distance that is less than or equal to the number of stones,
        // that it will visit the stones with a step "bird"
        let mut i = bird - 1; // Adjust index to be zero-based
        while i < stones {
            is_stone_safe[i] = false; // mark stone as unsafe
            i += bird;
        }
    }

    let safe_stones = is_stone_safe.iter().filter(|&&x| x).count();

    safe_stones
}

fn main() {

    let stones = 6;
    let birds = vec![3, 2];

    let safe_stones = count_safe_stones(stones, &birds);
    println!("Count of safe stones: {}", safe_stones);

}