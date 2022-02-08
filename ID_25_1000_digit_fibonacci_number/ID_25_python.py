from datetime import datetime
from numpy import array


def makeSameLength(a, b):
    for _ in range(len(b)-len(a)):
        a.insert(0, 0)
    return a, b


def makeArray(a, b):
    a, b = makeSameLength(a, b)
    return array([a, b])


def sumColumnsTuple(pair):
    mat = makeArray(pair[0], pair[1])
    result = []
    remainder = 0
    for column in reversed(range(mat.shape[1])):
        partialSum = remainder + sum(mat[:, column])
        result.insert(0, partialSum % 10)
        remainder = partialSum // 10
    if remainder != 0:
        result.insert(0, remainder)
    return result


def fibNUMdigits(num):
    currPair = ([1], [2])
    count = 3
    while len(currPair[1]) < num:
        currPair = (currPair[1], sumColumnsTuple(currPair))
        count += 1
    return count


NUM = 1000

begin_time = datetime.now()

print(fibNUMdigits(NUM))
print(datetime.now() - begin_time)
