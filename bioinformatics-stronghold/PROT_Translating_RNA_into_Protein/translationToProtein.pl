#!/usr/bin/env perl

use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input error\n";

# split input string into an array
my @seq = split "", <IN1>;

close IN1;

# hash lookup table for protein translation
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

# temporary codon
my $tri = "";

# loop through array
while (@seq) {
    # take every three nucleotides into temporary string
    $tri .= shift @seq;
    $tri .= shift @seq;
    $tri .= shift @seq;

    # stop translation if you hit stop codon
    if ($tri eq 'UAA' or $tri eq 'UAG' or $tri eq 'UGA' ) {
        last;
    }

    print "$hash{$tri}";
    $tri = ""; # reset temporary string
}

print "\n";
