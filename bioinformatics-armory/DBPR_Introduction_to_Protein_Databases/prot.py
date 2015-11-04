#!/bin/python

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

    for term in goTerms:
        if re.search("; P:", term):
            temp = term.split(";")[2].split(":")[1]
            print temp, "\n"
