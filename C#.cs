using System;
using System.Collections.Generic;

class Program
{
    static int CountEqualNumbers(List<int> sequence)
    {
        int count = 0;
        for (int i = 1; i < sequence.Count; i++)
        {
            if (sequence[i] == sequence[i - 1])
            {
                count++;
            }
        }
        return count;
    }

    static void Main()
    {
        List<int> sequence = new List<int> { 5, 12, 12, 23, 23, 23, 108 };
        int result = CountEqualNumbers(sequence);
        Console.WriteLine("Output: " + result);
    }
}