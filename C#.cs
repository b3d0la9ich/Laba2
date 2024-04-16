using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        List<string> emails = new List<string> { "maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru" };
        HashSet<string> uniqueEmails = new HashSet<string>();

        foreach (string email in emails)
        {
            int atPos = email.IndexOf('@');
            if (atPos != -1)
            {
                int lengthBeforeAt = atPos;
                if (lengthBeforeAt < 6 || lengthBeforeAt > 30)
                {
                    Console.WriteLine($"Error: The number of characters before @ in the address {email} should be between 6 and 30.");
                    return;
                }
            }
            else
            {
                Console.WriteLine($"Error: The address {email} does not contain the @ symbol.");
                return;
            }
        }

        foreach (string email in emails)
        {
            if (email.Count(c => c == '@') > 1)
            {
                Console.WriteLine($"Error: More than one '@' symbol in email: {email}");
                return;
            }

            string cleanedEmail = RemoveDots(email.Substring(0, email.IndexOf('@')));
            if (cleanedEmail != "wrong")
            {
                uniqueEmails.Add(cleanedEmail);
            }
        }

        Console.WriteLine($"Count of unique emails: {uniqueEmails.Count}");
    }

    static string RemoveDots(string s)
    {
        string result = "";
        for (int i = 0; i < s.Length - 1; i++)
        {
            if (s[i] == '.' && s[i + 1] == '.')
            {
                return "wrong";
            }
            if (s[0] == '.' || s[s.Length - 1] == '.')
            {
                return "wrong";
            }
        }

        foreach (char c in s)
        {
            if (c == '*')
            {
                return result;
            }
            if (c == '=' || c == '+' || c == '_' || c == '-' || c == ',' || c == '<' || c == '>' || c == '&' || c == '\'')
            {
                return "wrong";
            }

            if (c != '.')
            {
                result += c;
            }
        }
        return result;
    }
}