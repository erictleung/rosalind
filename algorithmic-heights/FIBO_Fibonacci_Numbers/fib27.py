#!/usr/bin/env python

# Python 2.7

# import package
import sys

# import file
data = sys.argv[1]

# read file
with open(data, "r") as fh:
    openDat = fh.readline().rstrip()

# fibonacci function
def fib(n):
    fibList = [0, 1]

    if n < 2:
        return fibList[n]
    else:
        for i in range(2, n + 1):
            newVal = fibList[i - 2] + fibList[i - 1]
            fibList.insert(len(fibList), newVal)

        return fibList.pop()

# write output
with open("out.txt", "w") as out:
    output = fib(int(openDat))
    out.write(str(output))
