#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

bool isPalindrome(string word);

int main()
{
    int largerstPalindrome = 0;
    int num;
    string stringNum;

    for (int i = 1; i < 1000; i++)
    {
        for (int j = 1; j < 1000; j++)
        {
            num = i * j;
            stringNum = to_string(num);
            if (isPalindrome(to_string(num)) && largerstPalindrome < num)
            {
                largerstPalindrome = num;
            }
        }
    }
    cout << "Biggest palindrome multiple of two 3-digit number is: " <<
    largerstPalindrome << endl;

    return 0;
}

bool isPalindrome(string word)
{
    int length = word.length();
    for (int i = 0; i < length / 2; i++)
    {
        if (word[i] != word[length - 1 - i])
        {
            return false;
        }
    }
    return true;
}

// answer: 906609