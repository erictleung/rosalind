#!/usr/bin/env perl

use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input error\n";

my @array = split " ", <IN1>;

my $total = 0;
foreach ( @array ) {
    $total += $_;
}

close IN1;

my $k = $array[0];
my $m = $array[1];
my $n = $array[2];

my $percent = 0;

$percent += ($k * (($k-1)+$m+$n)) / ($total*($total-1));
$percent += ($m * ($k+(($m-1)*0.75)+($n*0.5))) / ($total*($total-1));
$percent += ($n * ($k+($m*0.5))) / ($total*($total-1));

open( MYFILE, '> out.txt');
print MYFILE "$percent\n";
close MYFILE;
