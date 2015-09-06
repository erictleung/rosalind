#!/usr/bin/perl -w

use strict;
use Math::Combinatorics;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my @array = split " ", <IN1>;

my @c = combine(@array);
print join "\n", map { join " ", @$_ } @c;
print "\n";
