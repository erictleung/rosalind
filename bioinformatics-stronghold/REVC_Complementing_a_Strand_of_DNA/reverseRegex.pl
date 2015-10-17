#!/usr/bin/perl

# Program: 'reverseRegex'
# Given: A DNA string s of length at most 1000 bp
# Return: The reverse complement of s.
# Date: 2015 Oct 16
# Version: 5.16
# Note: Original solution found on Rosalind solutions

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n";

my @apha        = split "", <IN1>;
my @r_apha      = reverse(@apha);

# use regular expressions to get reverse complement
foreach (@r_apha) {
        tr/CATG/GTAC/;
        print;
}
print "\n";
exit(0);
