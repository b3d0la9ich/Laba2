def count_equal_numbers(sequence):
    count = 0
    for i in range(1, len(sequence)):
        if sequence[i] == sequence[i - 1]:
            count += 1
    return count

def main():
    try:
        n = int(input("Enter the number of elements: "))
    except ValueError:
        print("Error: Invalid input. Please enter an integer.")
        return 1

    sequence = []
    print("Enter the elements: ")
    for _ in range(n):
        try:
            num = int(input())
            sequence.append(num)
        except ValueError:
            print("Error: Invalid input. Please enter integers only.")
            return 1

    result = count_equal_numbers(sequence)
    print("Output:", result)
    return 0

if __name__ == "__main__":
    main()
