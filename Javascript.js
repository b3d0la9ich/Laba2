function removeDots(s) {
    let result = '';
    let ignore = false; // Flag indicating whether to ignore characters
    for (let i = 0; i < s.length; i++) {
        let c = s.charAt(i);
        if (c === '*') {
            ignore = true; // Encountered '*', start ignoring
        }
        if (!ignore && c !== '.') {
            result += c; // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result;
}

let emails = ["mar.pha+science@co.rp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru"];
let uniqueEmails = new Set();

// Checking for uniqueness of email addresses after removing dots
for (let email of emails) {
    let localPart = email.substring(0, email.indexOf('@'));
    let cleanedEmail = removeDots(localPart);
    uniqueEmails.add(cleanedEmail);
}

// Output the count of unique emails
console.log("Count of unique emails: " + uniqueEmails.size);