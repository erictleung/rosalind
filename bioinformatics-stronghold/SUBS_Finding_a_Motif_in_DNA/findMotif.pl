#!/usr/bin/perl

use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input error\n";

# Given: Two DNA strings s and t (each of length at most 1 kbp)
# Return: All locations of t as a substring of s

# Note: This is 1-based numbering so everything is plus one

my $seq = <IN1>;
my $motif = <IN1>;
chomp $seq;
chomp $motif;

close IN1;

my $match = index( $seq, $motif ) + 1; # index STR, SUBSTR, POSITION
print "$match ";

my $offset = $match + 1;

while( 1 == 1 ) {
    $match = index( $seq, $motif, $offset ) + 1;
    if( $match == 0 ) {
        last;
    }
    print "$match ";
    $offset = $match + 1;
}

close IN1;
