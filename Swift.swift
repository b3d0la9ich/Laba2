import Foundation

// Function to remove all dots from a string
func removeDots(from s: String) -> String {
    var result = ""
    var ignore = false // Flag indicating whether to ignore characters
    for c in s {
        if c == "*" {
            ignore = true // Encountered '*', start ignoring
        }
        if !ignore && c != "." {
            result.append(c) // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result
}

func main() {
    let emails = ["mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru"]
    var uniqueEmails = Set<String>()
    
    // Checking for uniqueness of email addresses after removing dots
    for email in emails {
        let localPart = email.components(separatedBy: "@").first ?? ""
        let cleanedEmail = removeDots(from: localPart)
        uniqueEmails.insert(cleanedEmail)
    }

    // Output the count of unique emails
    print("Count of unique emails: \(uniqueEmails.count)")
}

main()