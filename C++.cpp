#include <iostream>
#include <vector>

using namespace std;

int countEqualNumbers(vector<int>& sequence) {
    int count = 0;
    for (int i = 1; i < sequence.size(); i++) {
        if (sequence[i] == sequence[i - 1]) {
            count++;
        }
    }
    return count;
}

int main() {
    int n;
    cout << "Enter the number of elements: ";
    cin >> n;

    // Check if the input is a valid integer
    if (cin.fail()) {
        cout << "Error: Invalid input. Please enter an integer." << endl;
        cin.clear(); // Clear the error state
        return 1; // Exit with an error code
    }

    vector<int> sequence(n);
    cout << "Enter the elements: \n";
    for (int i = 0; i < n; i++) {
        cin >> sequence[i];
        // Check if the input is a valid integer
        if (cin.fail()) {
            cout << "Error: Invalid input. Please enter integers only." << endl;
            cin.clear(); // Clear the error state
            return 1;
        }
    }

    int result = countEqualNumbers(sequence);
    cout << "Output: " << result << endl;
    return 0;
}