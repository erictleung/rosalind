#!/usr/bin/perl -w
# Program 'independentAlleles'
# Given: Two positive integers k (k<=7) and N (N<=2^k). In this problem
#     we begin with Tom, who in the 0th generation has genotype AaBb.
#     Tom has two children in the 1st generation, each of whom has two
#     children, and so on. Each organism always mates with an organism 
#     having genotype AaBb.
# Return: The probability that at least N AaBb organism will belong to
#     the k-th generation of Tom's family tree (don't count the AaBb
#     mates at each level). Assume that Mendel's second law holds for 
#     the factors.

use strict;
use Math::Combinatorics;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

sub comb { # Parameters: N, k
    my $n_k = $_[0] - $_[1];
    factorial($_[0])/(factorial($_[1])*factorial($n_k));
}

my @vari = split " ", <IN1>;
my $k = $vari[0];
my $N = $vari[1];

my $prob = 0;
my $kids = 2 ** $k;

for ( $N; $N <= $kids; $N++ ) {
    $prob += comb($kids, $N)*(0.25**$N)*(0.75**($kids-$N));
}

print $prob,"\n";
