#!/usr/bin/python

# introBio.py
# Given: A DNA string s of length at most 1000 bp
# Return: Four integers (sparated by spaces) representing the respective number
#     of times that the symbol 'A', 'C', 'G', and 'T' occur in S.
# Usage: python introBio.py FILE
# Date: 2015 Oct 12
# Version: 2.7.8

# import necessary packages
import sys

# save file into file
file = sys.argv[1]

# nucleotide counts
numA = 0
numC = 0
numT = 0
numG = 0

# iterate through each line and count respective letter
with open(file, "r") as fh:
    for lines in fh:
        numA += lines.count("A")
        numC += lines.count("C")
        numT += lines.count("T")
        numG += lines.count("G")

# write out answer to file
with open("out.txt", "a") as out:
    out.write(str(numA) + " " + str(numC) + " " + str(numG) + " " + str(numT))
