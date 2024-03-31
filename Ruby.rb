def count_safe_stones(stones, birds)
    is_stone_safe = Array.new(stones + 1, true) # initialize all stones as safe
  
    birds.each do |bird|
      # if a bird can fly a distance that is less than or equal to the number of stones,
      # that it will visit the stones with a step "bird"
      i = bird
      while i <= stones
        is_stone_safe[i] = false # mark stone as unsafe
        i += bird
      end
    end
  
    safe_stones = is_stone_safe.count(true) - 1 # subtract 1 for 0-index
  
    safe_stones
  end
  
  def main
    stones = 6
    birds = [3, 2]
  
    safe_stones = count_safe_stones(stones, birds)
    puts "Count of safe stones: #{safe_stones}"
  end
  
  main