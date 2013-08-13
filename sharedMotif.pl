#!/usr/bin/perl -w

use strict;

# Given: A collection of k (k <= 100) DNA strings of length at
#     most 1 kbp each in FASTA format.
# Return: A longest common substring of the collection.

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my @seq; # This is to hold all of the sequences
my $current = ""; # Working sequence

while ( <IN1> ) {
    chomp; # Remove next line character
    if ( />.*/ ) { # Look for '>' character
        if ( $current eq "" ) { # Just for the initial condition
            next; # Will ignore the first '>' because names not important
        }
        else {
            push ( @seq, $current ); # Add full sequence to array
            $current = ""; # Reset working sequence
        }
    }
    else {
        $current .= $_; # Add to full sequence
    }
}

push ( @seq, $current ); # Add last sequence to array

@seq = sort { length $a <=> length $b } @seq; # Sort array by length

my $motif = ""; # Start with empty motif

# Will choose shortest two sequences to find initial motif
my $short = shift @seq; # Shortest sequence
my $long = shift @seq; # Second shortest sequence
my $len = length $short;
my $stringMotif = ""; 


print "$motif\n";
