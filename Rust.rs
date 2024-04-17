use std::io;

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
    println!("Enter the number of elements: ");
    let mut n = String::new();
    io::stdin().read_line(&mut n).expect("Failed to read line");
    let n: usize = match n.trim().parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Error: Invalid input. Please enter an integer.");
            return;
        }
    };

    let mut sequence = Vec::new();
    println!("Enter the elements: ");
    for _ in 0..n {
        let mut num = String::new();
        io::stdin().read_line(&mut num).expect("Failed to read line");
        let num: i32 = match num.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Error: Invalid input. Please enter integers only.");
                return;
            }
        };
        sequence.push(num);
    }

    let result = count_equal_numbers(&sequence);
    println!("Output: {}", result);
}
