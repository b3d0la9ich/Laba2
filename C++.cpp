#include <iostream>
#include <vector>
#include <set>

using namespace std;

// Function to remove all dots from a string
string removeDots(const string& s) {
    string result;
    bool ignore = false; // Flag indicating whether to ignore characters
    for (char c : s) {
        if (c == '*') {
            ignore = true; // Encountered '*', start ignoring
        }
        if (!ignore && c != '.') {
            result += c; // Add character to result if it's not '.' and ignore is not active
        }
    }
    return result;
}


int main() {
    vector<string> emails = { "marphascience@corp.nstu.ru", "marphascience@corp.nstu.ru", "marpha+science@corp.nstu.ru" };
    set<string> uniqueEmails;
    
    // Checking for uniqueness of email addresses after removing dots
    for (const string& email : emails) {
        string cleanedEmail = removeDots(email.substr(0, email.find('@')));
        uniqueEmails.insert(cleanedEmail);
    }

    // Output the count of unique emails
    cout << "Count of unique emails: " << uniqueEmails.size() << endl;
    return 0;
}
