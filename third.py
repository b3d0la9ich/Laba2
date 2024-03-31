def count_safe_stones(stones, birds):
    is_stone_safe = [True] * (stones + 1)  # initialize all stones as safe

    for bird in birds:
        # if a bird can fly a distance that is less than or equal to the number of stones,
        # that it will visit the stones with a step "bird"
        for i in range(bird, stones + 1, bird):
            is_stone_safe[i] = False  # mark stone as unsafe

    safe_stones = sum(is_stone_safe) - 1  # subtract 1 for 0-index

    return safe_stones


def main():
    stones = 6
    birds = [3, 2]

    safe_stones = count_safe_stones(stones, birds)
    print("Count of safe stones:", safe_stones)


if __name__ == "__main__":
    main()