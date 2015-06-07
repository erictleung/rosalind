#!/usr/bin/perl -w

use strict;
use Math::Combinatorics;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my @array = split " ",<IN1>;
my $total = 1;
my $num = $array[0];

for ( my $n = 1; $n <= $array[1]; $n++ ) {
    $total *= $num;
    $total %= 1000000;
    $num -= 1;
}

print $total;
