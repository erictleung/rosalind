#!/usr/bin/perl -w

# Program 'randomStrings'
# Given: DNA string 's' of length at most 100 bp and an array A
#     containing at most 20 numbers between 0 and 1.
# Return: An array B having the same length as A in which B[k]
#     represents the common logarithm of the probability that a
#     random string constructed with the GC-content found in A[k]
#     will match 's' exactly

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "Input Error.\n";

my @seq = split "", <IN1>; # Take DNA sequence
my @prob = split " ", <IN1>; # Take in GC-content percents
my @prob2; # Use for probabilities of DNA seq created
my ($gc,$at) = &countbp(@seq); # Count GC and AT content

foreach ( @prob ) {
    my ( $gcProb, $atProb ) = &gc($_);
    my $P = $gcProb ** $gc * $atProb ** $at;
    push @prob2, $P;
}

my @ar = &log10( @prob2 ); # Take log10 of each element
print "@ar\n"; # Print out probabilities

#----------SUBROUTINES-------------------------
#----------------------------------------------

sub log10 { # Returns logarithm base 10
    my @array;
    foreach my $n ( @_ ) {
        push @array, log($n)/log(10);
    }
    return @array;
}

sub gc { # Returns GC and AT probabilities, respectively
    my $gc = $_/2;
    my $at = (1 - $_)/2;
    return ($gc, $at);
}

sub countbp { # Returns GC and AT count, respectively
    my $gc = 0;
    my $at = 0;
    foreach ( @_ ) {
        if ( $_ eq 'G' or $_ eq 'C' ) {
            $gc += 1;
        }
        elsif ($_ eq 'A' or $_ eq 'T' ) {
            $at += 1;
        }
    }
    return ( $gc, $at );
}
