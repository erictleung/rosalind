#!/usr/bin/perl -w

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $waste = <IN1>;
my $seqStr = "";
while ( <IN1> ) {
    chomp;
    $seqStr .= $_;
}

my $index = length( $seqStr ) - 1;
my @fail = (); # Failure array initialize

for ( my $k = 0; $k < $index+1; $k++ ) { # Create full fail array
    push @fail, 0;
}

for ( my $n = 1; $n <= $index; $n++ ) {
    if 
}

$fail[0] = 0;
