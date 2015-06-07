#!/usr/bin/perl

# Program 'variAndArith'
# Given: Two positive integers a and b, each less than 1000
# Return: The integer corresponding to the square of the hypotenuse of
#     the right triangle whose legs have lengths a and b

use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input problem";

our $total; # Define the square of the hypotenuse
while( <IN1> ) {
    $total += $_ ** 2; # Add sqaure of each leg
}

print "$total\n";
