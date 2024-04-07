#include <iostream>
#include <vector>
using namespace std;

int countSafeStones(int stones, vector<int>& birds) {

    vector<bool> isStoneSafe(stones, true); // initialize all stones as safe

    for (int bird : birds) {

        // if a bird can fly a distance that is less than or equal to the number of stones,
        // that it will visit the stones with a step "bird"
        for (int i = bird; i <= stones; i += bird) {
            isStoneSafe[i] = false; // mark stone as unsafe
        }
    }

    int safeStones = 0;
    for (int i = 1; i <= stones; i++) {
        if (isStoneSafe[i]) {
            safeStones++; // add counts of safe stones
        }
    }

    return safeStones;
}

int main() {

    int stones = 6;
    vector<int> birds = { 3, 2 };
    
    // Проверка на отрицательные значения в векторе birds
    for (int bird : birds) {
        if (bird <= 0) {
            cout << "Error: finded negative value in vector birds. Exit." << endl;
            return 1; // Returning a non-zero value to indicate an error
        }
    }

    int safeStones = countSafeStones(stones, birds);
    cout << "Count of safe stones: " << safeStones << endl;

    return 0;
}
