#!/usr/bin/perl -w

# The 'expectedOffspring' program is for "Calculated Expected Offspring"
# Given: Six positive integers,e ach of which does not exceed 20,000.
#     The integers correspond to the number of couples in a population
#     possessing each genotype pairing for a given factor.
# Return: The expected number of offspring displaying the dominant phenotype
#     in the next generation, under the assumption that every couple has
#     exactly two offspring.

open ( IN1, $ARGV[0] ) || die "Input error\n";

my $input = <IN1>;
chomp $input;
my @type = split " ", $input;

my $num = $type[0]*2 + $type[1]*2 + $type[2]*2 + $type[3]*1.5 + $type[4];
print "$num\n";

close IN1;
