#!/usr/bin/perl

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n";

# Given: A DNA string t having length at most 1000 nt.
# Return: The transcribed RNA string of t.

my @seq = split "", <IN1>;

foreach ( @seq ) {
    if ( $_ eq 'T' ) {
        print 'U';
    }
    else { 
        print $_;
    }
}
