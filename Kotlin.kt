fun removeDots(s: String): String {
    val result = StringBuilder()
    var ignore = false // Flag indicating whether to ignore characters
    for (c in s) {
        if (c == '*') {
            ignore = true // Encountered '*', start ignoring
        }
        if (!ignore && c != '.') {
            result.append(c) // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result.toString()
}

fun main() {
    val emails = arrayOf("mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru")
    val uniqueEmails = mutableSetOf<String>()

    // Checking for uniqueness of email addresses after removing dots
    for (email in emails) {
        val localPart = email.substringBefore('@')
        val cleanedEmail = removeDots(localPart)
        uniqueEmails.add(cleanedEmail)
    }

    // Output the count of unique emails
    println("Count of unique emails: ${uniqueEmails.size}")
}