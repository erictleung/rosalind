#!/usr/bin/perl -w

# Program 'geneOrders'
# Given: Positive integer n <= 7
# Return: Total number of permutations of length n, followed by a
#     list of all such permutations (in any order).

use Math::Combinatorics;
use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $num = <IN1>;
chomp $num;
my @n;
my $total = 1;
for ( my $k = 1; $k <= $num; $k++ ) {
    push ( @n, $k );
    $total *= $k;
}

print $total,"\n";
my $len = @n;
my $combinat = Math::Combinatorics->new(count => 2,
                                        data => [@n],
                                       );
while(my @permu = $combinat->next_permutation){
    print join(' ', @permu)."\n";
}
