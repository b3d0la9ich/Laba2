using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<string> emails = new List<string> { "mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru" };
        HashSet<string> uniqueEmails = new HashSet<string>();

        foreach (string email in emails)
        {
            string cleanedEmail = RemoveDots(email.Substring(0, email.IndexOf('@')));
            uniqueEmails.Add(cleanedEmail);
        }

        Console.WriteLine("Count of unique emails: " + uniqueEmails.Count);
    }

    static string RemoveDots(string s)
    {
        string result = "";
        bool ignore = false;
        foreach (char c in s)
        {
            if (c == '*')
            {
                ignore = true;
            }
            if (!ignore && c != '.')
            {
                result += c;
            }
        }
        return result;
    }
}