#!/usr/bin/perl

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n";

# Given: Two DNA strings s and t of equal length (not exceeding 1 kbp).
# Return: The Hamming distance

my @word1 = split "", <IN1>;
my @word2 = split "", <IN1>;

my $len = scalar( @word1 );
my $first;
my $second;
my $count = 0;

while ( @word1 ) {
    $first = pop @word1;
    $second = pop @word2;
    if ( $first ne $second ) {
        $count += 1;
    }
}

print "$count\n";
close IN1;
