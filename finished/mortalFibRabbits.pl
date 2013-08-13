#!/usr/bin/perl

use warnings;
use strict;

open( IN1, $ARGV[0] ) || die "Input file error.\n";

# Given: Positive integers n<=100 and m<=20.
# Return: The total number of pairs of rabbits that will remain after the
#     n-th month (n<=100) if all rabbits live for m months (m<=20).

sub fib { # (n, n-1) 
    $_[0] + $_[1]; # Finds how many in next generation
}

our @ar = split( " ", <IN1> ); # (month, life expectancy)
our $month = 1; # start month
our @rabbits = (0, 0, 1, 0); # (babyPast, AdultPast, babyCurr, AdultCurr)
our @hist; # history array
my $n = 1; # used to create rabbit history

while( $n++ < $ar[1] ) { # creates list length = num of months rabbits live
    push( @hist, 0 ); # creating history of rabbits
}

# print "@hist\n"; # test the creation of history variable

while( $month++ < $ar[0] ) {
    $rabbits[0] = $rabbits[2]; # changing past baby
    $rabbits[1] = $rabbits[3]; # changing past adult
    $rabbits[2] = $rabbits[1]; # changing current baby
    $rabbits[3] = $rabbits[0] + $rabbits[1]; # changing current adults
    my $add = shift( @hist ); # the rabbit adjustment
    push( @hist, $rabbits[0] ); #changing rabbit baby history
    $rabbits[3] -= $add; # adjust for rabbits dying
#   print "@rabbits\n"; # debugging
#   print "@hist\n\n";  # debugging
}

close( IN1 );

my $total = $rabbits[2] + $rabbits[3];
print "$total\n";
