def is_divisable(num):
    for i in range(1,21):
        if num % i != 0:
            return False
    return True

num = 20
while not is_divisable(num):
    num += 1

print(num)