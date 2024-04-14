#include <iostream>
#include <vector>
#include <set>

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
        if (c == '=' || c == '+' || c == '_' || c == '-' || c == ','){
            return "wrong";
        }
        
        if (c != '.' ) {
            result += c; // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result;
}


int main() {
    vector<string> emails = { "mar.phas..cience@corp.nstu.ru", "marpha+scie.nce@corp.nstu.ru", "marph.a+s.c.i.e.n.c.e+@corp.nstu.ru" };
    set<string> uniqueEmails;
    
    // Checking for uniqueness of email addresses after removing dots
    for (const string& email : emails) {
        string cleanedEmail = removeDots(email.substr(0, email.find('@')));
        if (cleanedEmail != "wrong"){
        uniqueEmails.insert(cleanedEmail);
        }
    }

    // Output the count of unique emails
    cout << "Count of unique emails: " << uniqueEmails.size() << endl;
    return 0;
}
