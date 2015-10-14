#!/usr/bin/python

# RNA - Transcribing DNA into RNA
# ID: RNA
# Given: A DNA string t having length at most 1000 nt.
# Return: The transcribed RNA string of t.
# Date: 2015 Oct 14
# Python: 2.7.8

# import packages
import sys
import re

# take in any argument
file = sys.argv[1]

with open(file, "r") as fh:
    # create list to put lines in
    lines = []

    # append lines
    for line in fh:
        lines.append(line.rstrip())

expr = re.compile('T')

# write out answer to file
with open("out.txt", "w") as out:
    out.write(expr.sub('U', lines[0]))
