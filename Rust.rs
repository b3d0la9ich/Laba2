fn count_equal_numbers(sequence: &Vec<i32>) -> i32 {
    let mut count = 0;
    for i in 1..sequence.len() {
        if sequence[i] == sequence[i - 1] {
            count += 1;
        }
    }
    count
}

fn main() {
    let sequence = vec![5, 12, 12, 23, 23, 23, 108];
    let result = count_equal_numbers(&sequence);
    println!("Output: {}", result);
}