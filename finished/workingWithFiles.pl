#!/usr/bin/perl

# Program 'workingWithFiles'
# Given: A file containing at most 1000 lines
# Return: A file containing all the even-numbered lines from the 
#     original file. Assume 1-based numbering of lines

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error.\n";

my $n = 1; # First count

while ( <IN1> ) {
    chomp;
    if ( $n % 2 == 0 ) { # If even numbered
        print "$_\n";
    }
    $n += 1; # Increment
}

close IN1;
