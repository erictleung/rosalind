#!/usr/bin/perl

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error.\n";

# Given: A DNA string s of length at most 1000 nt
# Return: Four integers (separated by spaces) counting the respective
#     number of times that the symbols 'A', 'C', 'G', and 'T' occur in
#     s. 

my @string = split "", <IN1>;

my $A = 0;
my $C = 0;
my $T = 0;
my $G = 0;

foreach ( @string ) {
    if ( $_ eq "A" ) {
        $A += 1;
    }
    elsif ( $_ eq "C" ) {
        $C += 1;
    }
    elsif ( $_ eq "T" ) {
        $T += 1;
    }
    elsif ( $_ eq "G" ) {
        $G += 1;
    }
}

print "$A $C $G $T\n";

close IN1;
