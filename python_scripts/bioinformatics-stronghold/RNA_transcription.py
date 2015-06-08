#!/usr/bin/python

# RNA - Transcribing DNA into RNA
# ID: RNA
# Python: 2.7.9
# Given: A DNA string t having length at most 1000 nt.
# Return: The transcribed RNA string of t.

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
print expr.sub('U', lines[0])
