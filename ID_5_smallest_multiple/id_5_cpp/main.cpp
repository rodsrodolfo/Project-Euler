#include <iostream>
using namespace std;

bool is_divisable(int num) {
    for (int i = 2; i <= 20; i++) {
        if (num % i != 0) {
            return false;
        }
    }
    return true;
}

int main() {
    int num = 20;

    while (not is_divisable(num)) {
        num++;
    }

    cout << num << endl;

    return 0;
}