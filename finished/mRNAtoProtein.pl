#!/usr/bin/perl -w

# Program mRNAtoProtein.pl
# Given: A protein string of length at most 1000 aa.
# Return: The total number of different RNA strings from which the
#    protein could have been translated, modulo 1,000,000
#    (Don't neglect the importance of the stop codon in protein
#    translation.)

use strict;
open ( IN1, $ARGV[0] ) || die "Input error.";

# Frequency occurances in Amino Acid table
my %hash = (
    F => 2, S => 6, E => 2, C => 2, 
    L => 6, P => 4, Q => 2, W => 1,
    I => 3, T => 4, N => 2, R => 6,
    M => 1, Y => 2, K => 2, G => 4,
    V => 4, H => 2, D => 2, A => 4
);

my $seq;
while ( <IN1> ) {
    chomp;
    $seq .= $_; # Keep adding to seq in case in FASTA
}

my @line = split "", $seq; # Make into array 

my $RNA = 3; # Number of stop codons
foreach ( @line ) {
    $RNA *= $hash{$_}; # Multiple by each combination
    $RNA %= 1000000; # Modulo each time
}

print "$RNA\n";
close IN1;
