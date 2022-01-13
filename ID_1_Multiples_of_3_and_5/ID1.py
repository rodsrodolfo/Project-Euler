# Mateus Rodolfo 20220109
# Project Euler ID 1

"""If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000."""



multiples_sum = 0                               # variable to store the sum of found multiples

for i in range(1000):                           # iterate possible multiples
    if (i) % 3 == 0 or (i) % 5 == 0:                # checks for remainder (modulo operator)
        multiples_sum += i                      # adds found multiple to sum

print(multiples_sum)                            # prints the sum