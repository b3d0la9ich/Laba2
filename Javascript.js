const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function countEqualNumbers(sequence) {
  let count = 0;
  for (let i = 1; i < sequence.length; i++) {
    if (sequence[i] === sequence[i - 1]) {
      count++;
    }
  }
  return count;
}

rl.question('Enter the number of elements: ', (n) => {
  // Check if the input is a valid integer
  if (isNaN(n) || n < 0 || !Number.isInteger(parseFloat(n))) {
    console.log('Error: Invalid input. Please enter an integer.');
    rl.close();
    return;
  }

  const sequence = [];
  rl.question('Enter the elements: \n', (input) => {
    const elements = input.trim().split(/\s+/);
    for (let i = 0; i < elements.length; i++) {
      // Check if each input is a valid integer
      if (isNaN(elements[i]) || !Number.isInteger(parseFloat(elements[i]))) {
        console.log('Error: Invalid input. Please enter integers only.');
        rl.close();
        return;
      }
      sequence.push(parseInt(elements[i]));
    }

    const result = countEqualNumbers(sequence);
    console.log('Output:', result);
    rl.close();
  });
});
