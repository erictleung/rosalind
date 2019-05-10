# Given: A collection of at most 10 DNA strings of equal length (at most 1 kbp)
#   in FASTA format
# Return: A consensus string and profile matrix for the collection. (If several
#   possible consensus strings exist, then you may return one of them.)

# Import packages
import sys


if __name__ == "__main__":
    # Import file
    data = sys.argv[1]

    # Read file
    with open(data, "r") as fh:
        openDat = fh.readline().rstrip()

    # Create dictionary to count sequence nucleotides, key:seq, val:dict

    # Parse each sequence, skip ">" and read in ACTG sequence

    # Loop through each sequence and count in list of dictionaries

    # Write output
    with open("out.txt", "a") as out:
        # Format text to output
        out.write("Hello!")
