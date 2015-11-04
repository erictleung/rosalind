#!/bin/python

# import packages
import requests

prot = "Q5SLP9"

url = "http://www.uniprot.org/uniprot/" + str(prot) + ".txt"
page = requests.get(url).text
pageSplit = page.split("\n")
