#!/usr/bin/perl

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

# Given: Positive integers n<=40 and k<=5.
# Output: The total number of rabbit pairs that will be present after n
#     months if each pair of reproduction-age rabbits produces a little of
#     k rabbit pairs in each generation (instead of only 1 pair).

my @input = split(" ", <IN1>);
my $months = 1;
my $total = 1;
my $current = 1;
my $previous = 0;

while ($months++ < $input[0]) {
    $total = &fib($current, $previous, $input[1]);
    $previous = $current;
    $current = $total;
}

print $total,"\n";

sub fib { # (n, n-1, Litters) Input format
    $_[0] + $_[2]*$_[1]; # Returns next generation of rabbits
}
