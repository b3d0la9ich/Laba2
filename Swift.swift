import Foundation

// Function to remove all dots from a string
func removeDots(from s: String) -> String {
    var result = ""
    for i in 0..<s.count - 1 {
        if s[s.index(s.startIndex, offsetBy: i)] == "." && s[s.index(s.startIndex, offsetBy: i + 1)] == "." {
            return "wrong"
        }
        if s.first == "." || s.last == "." {
            return "wrong"
        }
    }

    for c in s {
        if c == "*" {
            return result
        }
        if c == "=" || c == "+" || c == "_" || c == "-" || c == "," || c == "<" || c == ">" || c == "&" || c == "'" {
            return "wrong"
        }
        
        if c != "." {
            result.append(c) // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result
}

let emails = ["maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru"]
var uniqueEmails = Set<String>()

// Проверка длины до символа "@"
for email in emails {
    if let atPos = email.range(of: "@")?.lowerBound {
        let lengthBeforeAt = email.distance(from: email.startIndex, to: atPos)
        if lengthBeforeAt < 6 || lengthBeforeAt > 30 {
            print("Ошибка: количество символов до @ в адресе \(email) должно быть между 6 и 30.")
            exit(1) // Выход с ошибкой
        }
    } else {
        print("Ошибка: адрес \(email) не содержит символ @.")
        exit(1) // Выход с ошибкой
    }
}

// Checking for uniqueness of email addresses after removing dots
for email in emails {
    // Check if there is more than one '@' in the email
    if email.filter({ $0 == "@" }).count > 1 {
        print("Error: More than one '@' symbol in email: \(email)")
        exit(1) // Exit the program with an error code
    }

    let cleanedEmail = removeDots(from: String(email.prefix(upTo: email.range(of: "@")?.lowerBound ?? email.endIndex)))
    if cleanedEmail != "wrong" {
        uniqueEmails.insert(cleanedEmail)
    }
}

// Output the count of unique emails
print("Count of unique emails: \(uniqueEmails.count)")
