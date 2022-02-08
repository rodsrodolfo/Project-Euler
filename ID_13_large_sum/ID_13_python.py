from numpy import array

lines = list(open(
    "/home/mateus/Documents/Coding/Project Euler/ID_13_large_sum/ID_13_source.txt", "r"))

nums = array([[int(char) for char in reversed(line.rstrip())]
             for line in reversed(lines)]).transpose()

result = ""
remainder = 0

for column in nums:
    partialSum = remainder + sum(column)
    result = str(partialSum % 10) + result
    remainder = partialSum//10

result = str(remainder) + result

print(result[0:10])

# answer: 5537376230
