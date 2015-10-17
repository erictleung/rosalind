#!/usr/bin/perl

# Program: 'reverseComplement'
# Given: A DNA string s of length at most 1000 bp
# Return: The reverse complement of s.
# Date 2015 Oct 16
# Version: 5.16

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n";

# split DNA string into array
my @string = split "", <IN1>;
my @new;

# loop through string and build new string based on forward string
foreach ( @string ) {
    if ( $_ eq 'A' ) {
        unshift @new, 'T';
    }
    elsif ( $_ eq 'C' ) {
        unshift @new, 'G';
    }
    elsif ( $_ eq 'T' ) {
        unshift @new, 'A';
    }
    elsif ( $_ eq 'G' ) {
        unshift @new, 'C';
    }
}

# write output to file
open ( MYFILE, '> out.txt' );
print MYFILE @new;

close IN1;
