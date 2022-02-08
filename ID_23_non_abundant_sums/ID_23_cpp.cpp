#include <stdio.h>
#include <bits/stdc++.h>
using namespace std;
#define MAX 28123

bool is_abundant(int j)
{
    int divisors = 0;
    for (int n = 2; n * n <= j; n++)
    {
        if (!(j % n))
        {
            divisors += n;
            if (n < j / n)
                divisors += j / n;
            if (j <= divisors)
                return true;
        }
    }
    return j <= divisors;
}
int main()
{
    time_t start, end;
    time(&start);
    int abundant[MAX];
    bool checked[MAX];
    int count = 0, total = 0;
    for (int n = 1; n < MAX; n++)
        if (is_abundant(n))
            abundant[count++] = n;
    for (int a = 0; a < count; a++)
        for (int b = a; b < count; b++)
            if (abundant[a] + abundant[b] < MAX)
                checked[abundant[a] + abundant[b]] = true;
    for (int n = 1; n < MAX; n++)
        if (!checked[n])
            total += n;
    printf("%d\n", total);
    time(&end);
    double time_taken = double(end - start);
    cout << "Time taken by program is : " << fixed
         << time_taken << setprecision(5);
    cout << " sec " << endl;
    return 0;
}