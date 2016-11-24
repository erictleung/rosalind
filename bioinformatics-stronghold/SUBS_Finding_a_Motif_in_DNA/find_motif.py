#!/usr/bin/env python

# Python 2.7

# import package
import sys

# import file
data = sys.argv[1]

# read file
with open(data, "r") as fh:
    openDat = fh.readlines()
    openDat = [item.rstrip() for item in openDat]  # remove new line char

indices = []  # array to hold indices where substring occurs
tempIndex = 0
start = 0
while tempIndex != -1:
    tempIndex = openDat[0].find(openDat[1], start)  # look for indices
    if tempIndex == -1:
        break
    else:
        indices.append(tempIndex + 1)  # add to list of indices
        start = tempIndex + 1  # start searching from stop site
outData = [str(index) for index in indices]  # convert indices to characters
outDataStr = " ".join(outData)  # combine results into one string

# write output
with open("out.txt", "a") as out:
    out.write(outDataStr)
