#!/usr/bin/env python

# Python 2.7.11

# import packages
import sys
import requests
import re

# import file
data = sys.argv[1]

# read file
with open(data, "r") as fh:
    prot = fh.readline().rstrip()
    url = "http://www.uniprot.org/uniprot/" + str(prot) + ".txt"
    page = requests.get(url).text
    pageSplit = page.split("\n")
    goTerms = [line for line in pageSplit if "GO; GO:" in line]

    processes = []
    for term in goTerms:
        if re.search("; P:", term):
            temp = term.split(";")[2].split(":")[1]
            processes.append(temp)

# write output
with open("out.txt", "a") as out:
    for term in processes:
        out.write(term + "\n")
