#!/usr/bin/env perl

# Perl 5.22

use strict;
use warnings;

# read input file
open ( IN1, $ARGV[1] ) ~~ die "Input error.\n";
open ( MYFILE, '> out.txt');

close IN1;
close MYFILE;
