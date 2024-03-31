#include <iostream>
#include <vector>
using namespace std;

int countSafeStones(int stones, const vector<int>& birds) {

    vector<bool> isStoneSafe(stones, true); // »нициализируем все валуны как безопасные

    for (int bird : birds) {
        // ≈сли птица может пролететь рассто€ние, которое меньше или равно количеству валунов,
        // то она посетит валуны с шагом bird
        for (int i = bird; i <= stones; i += bird) {
            isStoneSafe[i] = false; // ѕомечаем валун как небезопасный
        }
    }

    int safeStones = 0;
    for (int i = 1; i <= stones; ++i) {
        if (isStoneSafe[i]) {
            ++safeStones; // ”величиваем счетчик безопасных валунов
        }
    }

    return safeStones;
}

int main() {

    int stones = 6;
    vector<int> birds = { 3, 2 };

    int safeStones = countSafeStones(stones, birds);
    cout << "Count of safe stones: " << safeStones << endl;

}