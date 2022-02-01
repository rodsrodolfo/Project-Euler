def factorization(num):
    factorization = {}
    factor = 2
    while num != 1:
        if num % factor == 0:
            if factor in factorization.keys():
                factorization[factor] += 1
            else:
                factorization[factor] = 1
            num /= factor
        else:
            if factor == 2:
                factor += 1
            else:
                factor += 2
    return factorization


def distinctPowers(A, B):
    distinctPowersList = []
    for a in range(2, A+1):
        factoringA = factorization(a)
        for b in range(2, B+1):
            factoringAB = factoringA.copy()
            for key in factoringAB.keys():
                factoringAB[key] *= b
            if factoringAB not in distinctPowersList:
                distinctPowersList.append(factoringAB)
    return len(distinctPowersList)

A, B = 100, 100

from datetime import datetime
begin_time = datetime.now()

print(distinctPowers(A,B))
print(datetime.now() - begin_time)