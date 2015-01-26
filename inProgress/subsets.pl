#!/usr/bin/perl -w

# Program 'subsets'
# Given: A positive integer n (n <= 1000)
# Return: The total number of subsets of {1,2,...,n} mod 1000000

open ( IN1, $ARGV[0] ) || die "Input Error.\n";

my $n = <IN1>;
chomp $n;

my $sets = 2 ** $n % 1000000;
print $sets,"\n";
close IN1;
