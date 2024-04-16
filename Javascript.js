function removeDots(s) {
    let result = '';
    for (let i = 0; i < s.length - 1; i++){
        if (s[i] === '.' &&  s[i+1] === '.') {
            return "wrong";
        }
        if(s[0] === '.' || s[s.length - 1] === '.'){
            return "wrong";
        }
    }

    for (let c of s) {
        if (c === '*') {
            return result;
        }
        if (c === '=' || c === '+' || c === '_' || c === '-' || c === ',' || c === '<' || c === '>' || c === '&' || c === '\''){
            return "wrong";
        }
        
        if (c !== '.' ) {
            result += c; // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result;
}

let emails = [ "maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru" ];
let uniqueEmails = new Set();

// Проверка длины до символа "@"
for (const email of emails) {
    let atPos = email.indexOf('@');
    if (atPos !== -1) {
        let lengthBeforeAt = atPos;
        if (lengthBeforeAt < 6 || lengthBeforeAt > 30) {
            console.log("Ошибка: количество символов до @ в адресе " + email + " должно быть между 6 и 30.");
            process.exit(1); // Выход с ошибкой
        }
    } else {
        console.log("Ошибка: адрес " + email + " не содержит символ @.");
        process.exit(1); // Выход с ошибкой
    }
}

// Checking for uniqueness of email addresses after removing dots
for (const email of emails) {
    // Check if there is more than one '@' in the email
    if ((email.match(/@/g) || []).length > 1) {
        console.log("Error: More than one '@' symbol in email: " + email);
        process.exit(1); // Exit the program with an error code
    }

    let cleanedEmail = removeDots(email.substring(0, email.indexOf('@')));
    if (cleanedEmail !== "wrong"){
        uniqueEmails.add(cleanedEmail);
    }
}

// Output the count of unique emails
console.log("Count of unique emails: " + uniqueEmails.size);