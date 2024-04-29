#include <iostream>
#include <vector>
#include <set>
#include <string>
#include <algorithm>

using namespace std;

// Function to remove all dots from a string
string removeDots(const string s) {
    string result;
    for (int i = 0; i < s.size() - 1; i++){
        if (s[i] == '.' &&  s[i+1] == '.') {
            return "wrong";
        }
        if(s[0] == '.' || s.back() == '.'){
            return "wrong";
        }
    }

    for (char c : s) {
        if (c == '*') {
            return result;
        }
        if (c == '=' || c == '+' || c == '_' || c == '-' || c == ',' || c == '<' || c == '>' || c == '&' || c == '\''){
            return "wrong";
        }
        
        if (c != '.' ) {
            result += c; // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result;
}

int main() {
    vector<string> emails = { "maaaasdf@dsf@p.nstu.ru", "marphascience@corp.nstu.ru", "marphas.c.i.e.n.c.e@corp.nstu.ru" };
    set<string> uniqueEmails;
    
    // Проверка длины до символа "@"
    for (const string& email : emails) {
        size_t atPos = email.find('@');
        if (atPos != string::npos) {
            size_t lengthBeforeAt = atPos;
            if (lengthBeforeAt < 6 || lengthBeforeAt > 30) {
                cout << "Ошибка: количество символов до @ в адресе " << email << " должно быть между 6 и 30." << endl;
                return 1; // Выход с ошибкой
            }
        } else {
            cout << "Ошибка: адрес " << email << " не содержит символ @." << endl;
            return 1; // Выход с ошибкой
        }
    }

// Checking for uniqueness of email addresses after removing dots
for (const string& email : emails) {
    // Получаем часть после '@'
    size_t atIndex = email.find('@');
    if (atIndex == string::npos) {
        cout << "Ошибка: адрес " << email << " не содержит символ @." << endl;
        return 1; // Выход с ошибкой
    }

    string domain = email.substr(atIndex + 1); // Получаем доменное имя
    if (domain != "corp.nstu.ru") {
        cout << "Ошибка: адрес " << email << " имеет недопустимый доменный адрес." << endl;
        return 1; // Выход с ошибкой
    }

    // Check if there is more than one '@' in the email
    if (count(email.begin(), email.end(), '@') > 1) {
        cout << "Ошибка: более одного символа '@' в адресе: " << email << endl;
        return 1; // Выход с ошибкой
    }

    string cleanedEmail = removeDots(email.substr(0, atIndex));
    if (cleanedEmail != "wrong") {
        uniqueEmails.insert(cleanedEmail);
    }
}


    // Output the count of unique emails
    cout << "Count of unique emails: " << uniqueEmails.size() << endl;
    return 0;
}