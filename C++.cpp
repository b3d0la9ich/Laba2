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
    vector<int> sequence = {5, 12, 12, 23, 23, 23, 108};
    int result = countEqualNumbers(sequence);
    cout << "Output: " << result << endl;
    return 0;
}