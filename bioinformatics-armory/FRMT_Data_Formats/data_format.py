#!/usr/bin/env python

# Python 2.7

# import package
import sys
from Bio import Entrez
from Bio import SeqIO

# import file
data = sys.argv[1]

# read file
with open(data, "r") as fh:
    raw = fh.readline().rstrip()
    ids = raw.split(" ")

# get user information to query
Entrez.email = raw_input("What is your email?: ")
handle = Entrez.efetch(db="nucleotide", id=ids, rettype="fasta")
records = list(SeqIO.parse(handle, "fasta"))

# write output
with open("out.txt", "a") as out:
    out.write("")
