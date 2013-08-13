#!/usr/bin/perl

# Program 'conditionAndLoops'
# Given: Two positive integers a dn b (a<b<10000)
# Return: The summ of all odd integers from a through b, inclusive

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n.";

my @integers = split " ", <IN1>; # Put parameters into array

my $current = $integers[0]; # Start number
my $total = 0; # Total

while ( $current <= $integers[1] ) {
    if ( $current % 2 == 1 ) { # Only odd
        $total += $current; # Add to total
    }
    $current += 1; # Increment
}

print "$total\n";

close IN1;
