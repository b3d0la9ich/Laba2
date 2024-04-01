def count_equal_numbers(sequence)
  count = 0
  (1...sequence.length).each do |i|
      if sequence[i] == sequence[i - 1]
          count += 1
      end
  end
  count
end

sequence = [5, 12, 12, 23, 23, 23, 108]
result = count_equal_numbers(sequence)
puts "Output: #{result}"

