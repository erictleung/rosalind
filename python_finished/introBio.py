#!/usr/bin/python

# introBio.py
# Given: A DNA string s of length at most 1000 bp
# Return: Four integers (sparated by spaces) representing the respective number
# of times that the symbol 'A', 'C', 'G', and 'T' occur in S.

# import necessary packages
from Bio.Seq import Seq
import sys

# save file into file
file = sys.argv[1]

# nucleotide counts
numA = 0
numC = 0
numT = 0
numG = 0

with open(file, "r") as fh:
    for lines in fh:
        numA += lines.count("A")
        numC += lines.count("C")
        numT += lines.count("T")
        numG += lines.count("G")

print str(numA) + " " + str(numC) + " " + str(numG) + " " + str(numT)
