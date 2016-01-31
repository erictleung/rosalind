#!/usr/bin/env python

# Python 2.7

# import package
import sys

# import file
data = sys.argv[1]

# read file
with open(data, "r") as fh:
    openDat = fh.readline().rstrip()

# write output
with open("out.txt", "a") as out:
    out.write("Hello!")
