#!/usr/bin/perl

# Program 'splicedMotif'
# Given: Two DNA string s and t (each of length at most 1 kbp)
#     in FASTA format
# Return: One collection of indices of s in which the symbols
#     of t appear as a subsequence of s.

use strict;
use warnings;

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

my $first = $seq[0];
my @large = split "", $first;
my $sec = $seq[1];
my @small = split "", $sec;

my @list = ();
#print $#small+1,"\n";
my $letter = shift @small;

#print "First: $letter\n";

for ( my $n = 0; $n <= $#large; $n++ ) {
    my $last = 0;
#   print "Iteration: $n\n";
    if ( $letter ) {
        if ( $letter eq $large[$n] ) {
#           print "Letter: $letter\n";
            push ( @list, $n+1 );
            $letter = shift @small;
            $n += 1;
        }
    }
}

#pop @list;
print "@list\n";
