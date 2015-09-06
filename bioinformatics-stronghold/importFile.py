#!/usr/bin/python

# Import File
# Python: 2.7.9
# Purpose: This is a commonly written script to import files into python
# Input: None
# Output: list of lines

import sys

def importFile():
    file = sys.argv[1]

    with open(file, "r") as fh:
        lines = []

        for line in fh:
            lines.append(line.rstrip())

    return lines
