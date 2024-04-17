using System;
using System.Collections.Generic;

public class Program
{
    public static int CountEqualNumbers(List<int> sequence)
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

    public static void Main()
    {
        Console.Write("Enter the number of elements: ");
        if (!int.TryParse(Console.ReadLine(), out int n))
        {
            Console.WriteLine("Error: Invalid input. Please enter an integer.");
            return;
        }

        List<int> sequence = new List<int>(n);
        Console.WriteLine("Enter the elements: ");
        for (int i = 0; i < n; i++)
        {
            if (!int.TryParse(Console.ReadLine(), out int num))
            {
                Console.WriteLine("Error: Invalid input. Please enter integers only.");
                return;
            }
            sequence.Add(num);
        }

        int result = CountEqualNumbers(sequence);
        Console.WriteLine("Output: " + result);
    }
}
