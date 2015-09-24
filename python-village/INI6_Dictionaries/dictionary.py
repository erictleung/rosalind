#!/usr/bin/python

# dictionary.py
# Given: A string s of length at most 10,000 letters
# Return: How many times any word occurred in string. Each letter (upper or
#     lower) in word matters. Lines in output can be in any order
# Usage: python dictionary.py FILE
# Date: 2015 Sept 23
# Version: 2.7.10

# import packages
import sys

# take in any argument
file = sys.argv[1]

with open(file, "r") as fh:
    lines = [] # create list to put lines in
    dict = {}

    # iterate through lines in file and put them into lines list
    for line in fh:
        lines.append(line.rstrip()) # add to line and remove new line char
    
    # split elements in list into words
    for ln in lines: # iterate over lines in file
        words = ln.split(" ") # split line into words
        for word in words: # iterate through words in line
            if dict.get(word) == None: # if the word isn't in dict already
                dict[word] = 1 # set first occurance of word to one
            else:
                dict[word] += 1 # add one to occurance

    # print out items in dictionary
    for key, value in dict.items():
        with open("out.txt", "a") as out:
            out.write(key + " " + str(value) + "\n")
