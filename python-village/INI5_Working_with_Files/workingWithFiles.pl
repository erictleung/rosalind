#!/usr/bin/perl

# Program 'workingWithFiles'
# Given: A file containing at most 1000 lines
# Return: A file containing all the even-numbered lines from the 
#     original file. Assume 1-based numbering of lines
# Date: 2015 Sept 23
# Version: 5.16

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error.\n";
open ( MYFILE, '> out.txt' );

my $n = 1; # First count

while ( <IN1> ) {
    chomp;
    if ( $n % 2 == 0 ) { # If even numbered
        print MYFILE "$_\n";
    }
    $n += 1; # Increment
}

close IN1;
close MYFILE;
