#!/usr/bin/perl

# Program 'variAndArith'
# Given: Two positive integers a and b, each less than 1000
# Return: The integer corresponding to the square of the hypotenuse of
#     the right triangle whose legs have lengths a and b
# Date: 2015 Sept 15
# Version: 5.16

use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input problem";

my @array = split " ", <IN1>;
our $total; # Define the square of the hypotenuse

foreach ( @array ){
    $total += $_ ** 2; # Add sqaure of each leg
}

open( MYFILE, '>out.txt' );
print MYFILE $total, "\n";
close( MYFILE );
