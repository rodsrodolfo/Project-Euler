def collatz(num):
    originalNum = num
    stepsCount = 0
    while num != 1:
        if num % 2 == 0:
            num /= 2
        else:
            num = 3*num + 1
        stepsCount += 1
    return {"num": originalNum, "steps": stepsCount}

def findLongestCollatz(num):
    longest = {"steps": 0}
    for i in range(1, num+1):
        current = collatz(i)
        if current["steps"] > longest["steps"]:
            longest = current
    return longest

num = 999999

print(findLongestCollatz(num))

# answer: 837799
