#!/usr/bin/perl

# Program 'conditionAndLoops'
# Given: Two positive integers a and b (a<b<10000)
# Return: The summ of all odd integers from a through b, inclusive
# Date: 2015 Sept 23
# Version: 5.16

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n.";

my @integers = split " ", <IN1>; # Put parameters into array
close IN1;

my $current = $integers[0]; # Start number
my $total = 0; # Total

while ( $current <= $integers[1] ) {
    if ( $current % 2 == 1 ) { # Only odd
        $total += $current; # Add to total
    }
    $current += 1; # Increment
}

open ( MYFILE, '> out.txt' );
print MYFILE $total;
close ( MYFILE );
