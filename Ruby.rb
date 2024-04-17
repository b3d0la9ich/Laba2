def count_equal_numbers(sequence)
  count = 0
  (1...sequence.length).each do |i|
    if sequence[i] == sequence[i - 1]
      count += 1
    end
  end
  count
end

puts "Enter the number of elements: "
n = gets.chomp.to_i

if n == 0
  puts "Error: Invalid input. Please enter an integer."
  return
end

sequence = []
puts "Enter the elements: "
n.times do
  element = gets.chomp.to_i
  if element == 0
    puts "Error: Invalid input. Please enter integers only."
    return
  end
  sequence << element
end

result = count_equal_numbers(sequence)
puts "Output: #{result}"
