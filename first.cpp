#include <iostream>
#include <vector>
using namespace std;

int countSafeStones(int stones, const vector<int>& birds) {

    vector<bool> isStoneSafe(stones, true); // �������������� ��� ������ ��� ����������

    for (int bird : birds) {
        // ���� ����� ����� ��������� ����������, ������� ������ ��� ����� ���������� �������,
        // �� ��� ������� ������ � ����� bird
        for (int i = bird; i <= stones; i += bird) {
            isStoneSafe[i] = false; // �������� ����� ��� ������������
        }
    }

    int safeStones = 0;
    for (int i = 1; i <= stones; ++i) {
        if (isStoneSafe[i]) {
            ++safeStones; // ����������� ������� ���������� �������
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