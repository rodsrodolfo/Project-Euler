def cycleSize(num):
    size = 0
    remainder = 10 % num
    if remainder == 0:
        return 0
    remainders = [remainder]
    while True:
        size += 1
        remainder = (remainder * 10) % num
        if remainder in remainders or remainder == 0:
            return size
        remainders.append(remainder)
    
def longestCycle(num):
    largest = 0
    found = 0
    for i in range(1,num+1):
        currCycle = cycleSize(i)
        if currCycle > largest:
            largest = currCycle
            found = i
    return found, largest

NUM = 999

from datetime import datetime
begin_time = datetime.now()

print("number: 1/%s\ncycle size: %s" %longestCycle(NUM))
print(datetime.now() - begin_time)
