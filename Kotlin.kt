fun removeDots(s: String): String {
    var result = ""
    for (i in 0 until s.length - 1) {
        if (s[i] == '.' && s[i + 1] == '.') {
            return "wrong"
        }
        if (s[0] == '.' || s.last() == '.') {
            return "wrong"
        }
    }

    for (c in s) {
        if (c == '*') {
            return result
        }
        if (c == '=' || c == '+' || c == '_' || c == '-' || c == ',' || c == '<' || c == '>' || c == '&' || c == '\'') {
            return "wrong"
        }

        if (c != '.') {
            result += c // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result
}

fun main() {
    val emails = listOf("maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru")
    val uniqueEmails = mutableSetOf<String>()

    // Проверка длины до символа "@"
    for (email in emails) {
        val atPos = email.indexOf('@')
        if (atPos != -1) {
            val lengthBeforeAt = atPos
            if (lengthBeforeAt < 6 || lengthBeforeAt > 30) {
                println("Ошибка: количество символов до @ в адресе $email должно быть между 6 и 30.")
                return
            }
        } else {
            println("Ошибка: адрес $email не содержит символ @.")
            return
        }
    }

    // Checking for uniqueness of email addresses after removing dots
    for (email in emails) {
        // Check if there is more than one '@' in the email
        if (email.count { it == '@' } > 1) {
            println("Error: More than one '@' symbol in email: $email")
            return
        }

        val cleanedEmail = removeDots(email.substring(0, email.indexOf('@')))
        if (cleanedEmail != "wrong") {
            uniqueEmails.add(cleanedEmail)
        }
    }

    // Output the count of unique emails
    println("Count of unique emails: ${uniqueEmails.size}")
}
