#include <iostream>
#include <bits/stdc++.h>
using namespace std;

int main() {
    time_t start, end;
    time(&start);
    int evenSum = 0;
    int pairSum = 0;
    int currentPair[2] = {1, 2};

    while (currentPair[1] < 4000000)
    {
        if (currentPair[1] % 2 == 0)
        {
            evenSum += currentPair[1];
        }
        pairSum = currentPair[0] + currentPair[1];
        currentPair[0] = currentPair[1];
        currentPair[1] = pairSum;
    }
    cout << "The sum of all even-values of the fibonacci sequence which" <<
    "do not exceed 4 million is: " << evenSum << endl;

    time(&end);
    double time_taken = double(end - start);
    cout << "Time taken by program is : " << fixed
         << time_taken << setprecision(5);
    cout << " sec " << endl;
    return 0;
}

// answer: 4613732