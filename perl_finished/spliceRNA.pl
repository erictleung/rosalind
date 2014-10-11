#!/usr/bin/perl -w

# Program 'spliceRNA'
# Given: A DNA string s (of length at most 1 kbp) and a collection of
#     substrings of s acting as introns. All strings are given in 
#     FASTA format
# Return: A protein string results from transcribing and translating
#     the exons of s. (Notes: only one solution will exist for the data
#     set provided.)

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $seq; # Current string working with
my @seqs; # Array for all strings
while ( <IN1> ) {
    chomp; # Remove new line character
    if ( />.*/ ) { # Find name of sequence
        push ( @seqs, $seq );
        $seq = ""; # Reset sequence
    }
    else {
        $seq .= $_; # Add to sequence
    }
}

push ( @seqs, $seq ); # Add last sequence to end of array
shift @seqs; # Array has empty first element; needs to be removed
my $main = shift ( @seqs ); # Full RNA sequence
foreach ( @seqs ) {
   $main =~ s/$_//g; 
}

# Amino Acid Table
my %hash = (
    'UUU' => 'F',  'UCU' => 'S',  'UAU' => 'Y',    'UGU' => 'C',
    'UUC' => 'F',  'UCC' => 'S',  'UAC' => 'Y',    'UGC' => 'C',
    'UUA' => 'L',  'UCA' => 'S',  'UAA' => 'STOP', 'UGA' => 'STOP',
    'UUG' => 'L',  'UCG' => 'S',  'UAG' => 'STOP', 'UGG' => 'W',
    'CUU' => 'L',  'CCU' => 'P',  'CAU' => 'H',    'CGU' => 'R',
    'CUC' => 'L',  'CCC' => 'P',  'CAC' => 'H',    'CGC' => 'R',
    'CUA' => 'L',  'CCA' => 'P',  'CAA' => 'Q',    'CGA' => 'R',
    'CUG' => 'L',  'CCG' => 'P',  'CAG' => 'Q',    'CGG' => 'R',
    'AUU' => 'I',  'ACU' => 'T',  'AAU' => 'N',    'AGU' => 'S',
    'AUC' => 'I',  'ACC' => 'T',  'AAC' => 'N',    'AGC' => 'S',
    'AUA' => 'I',  'ACA' => 'T',  'AAA' => 'K',    'AGA' => 'R',
    'AUG' => 'M',  'ACG' => 'T',  'AAG' => 'K',    'AGG' => 'R',
    'GUU' => 'V',  'GCU' => 'A',  'GAU' => 'D',    'GGU' => 'G',
    'GUC' => 'V',  'GCC' => 'A',  'GAC' => 'D',    'GGC' => 'G',
    'GUA' => 'V',  'GCA' => 'A',  'GAA' => 'E',    'GGA' => 'G',
    'GUG' => 'V',  'GCG' => 'A',  'GAG' => 'E',    'GGG' => 'G'
);

$main =~ s/T/U/g;

my @mainSeq = split "", $main;

my $tri = "";

while (@mainSeq) {
    $tri .= shift @mainSeq;
    $tri .= shift @mainSeq;
    $tri .= shift @mainSeq;
    if ($tri eq 'UAA' or $tri eq 'UAG' or $tri eq 'UGA' ) {
        last;
    }
    print "$hash{$tri}";
    $tri = "";
}
print "\n";
close IN1;
