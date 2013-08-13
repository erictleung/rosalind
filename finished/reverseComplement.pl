#!/usr/bin/perl

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n";

# Given: A DNA string s of length at most 1000 bp
# Return: The reverse complement of s.

my @string = split "", <IN1>;
my @new;

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

print @new;

close IN1;
