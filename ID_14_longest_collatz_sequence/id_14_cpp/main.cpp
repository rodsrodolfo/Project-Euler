#include <iostream>
using namespace std;

long int len_collatz(long int num) {
    long int len{1};
    while (num != 1) {
        len++;
        if (num % 2 == 0) {
            num = num / 2;
        } else {
            num = 3 * num + 1;
        }
    }
    return len;
}

int main(int argc, char const *argv[]) {
    long int num{1}, len{len_collatz(1)}, len_i;
    for (long int i = 2; i < 1000000; i++)
    {
        len_i = len_collatz(i);
        if (len_i > len)
        {
            num = i;
            len = len_i;
        }
        
    }
    cout << "Number: " << num << endl;
    cout << "Length: " << len << endl;
    return 0;
}