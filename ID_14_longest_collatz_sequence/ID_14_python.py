def collatz(num):
    counter = 0
    while num != 1:
        counter += 1
        if num % 2 == 0:
            num /= 2
        else:
            num = 3*num + 1
    return counter


NUM = 10**6

mylist = list(map(collatz, range(1, NUM)))
maxlist = max(mylist)
indicemax = mylist.index(maxlist)

print(indicemax+1)

# answer: 837799
