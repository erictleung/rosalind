#!/usr/bin/python

# Finding a Shared Motif
# GIVEN: A collection of k (k <= 100) DNA strings of length at most 1 kbp each
#   in FASTA format
# RETURN: A longest common substring of the collection
# Example:
# python sharedMotif.py <DATA FILE>

# Import packages
from Bio import SeqIO
import sys

# Read in Data
def readData():
    """
    Reads in first FASTA file given as a command line argument
    """
    file = sys.argv[1] # take command line argument
    record = SeqIO.parse(file, "fasta") # assumes FASTA
    return record

# 

# Script
record = readData()
