using System;
using System.Collections.Generic;

class Program
{
    static int CountSafeStones(int stones, List<int> birds)
    {
        bool[] isStoneSafe = new bool[stones + 1]; // initialize all stones as safe
        for (int i = 0; i <= stones; i++)
        {
            isStoneSafe[i] = true;
        }

        foreach (int bird in birds)
        {
            // if a bird can fly a distance that is less than or equal to the number of stones,
            // that it will visit the stones with a step "bird"
            for (int i = bird; i <= stones; i += bird)
            {
                isStoneSafe[i] = false; // mark stone as unsafe
            }
        }

        int safeStones = 0;
        for (int i = 1; i <= stones; i++)
        {
            if (isStoneSafe[i])
            {
                safeStones++; // add counts of safe stones
            }
        }

        return safeStones;
    }

    static void Main()
    {
        int stones = 6;
        List<int> birds = new List<int> { 3, 2 };

        int safeStones = CountSafeStones(stones, birds);
        Console.WriteLine("Count of safe stones: " + safeStones);
    }
}