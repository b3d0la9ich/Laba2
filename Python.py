def count_equal_numbers(sequence):
    count = 0
    for i in range(1, len(sequence)):
        if sequence[i] == sequence[i - 1]:
            count += 1
    return count

sequence = [5, 12, 12, 23, 23, 23, 108]
result = count_equal_numbers(sequence)
print("Output:", result)

