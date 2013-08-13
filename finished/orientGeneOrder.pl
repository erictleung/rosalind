#!/usr/bin/perl -w

use strict;
use Math::Combinatorics;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $var = <IN1>;
chomp $var;
my @n;

for ( my $k = -$var; $k <= $var; $k++ ) {
    if ( $k == 0 ) {
        next;
    }
    push ( @n, $k );
}

my $len = @n;
my $total = 1;
for ( $len; $len != 0; $len -= 2 ) {
    $total *= $len;
}
print "$total\n";

my $combinat = Math::Combinatorics->new(count => $var,
                                        data => [@n],
                                       );
while ( my @combo = $combinat->next_combination) {
    my $stop = 0;
    foreach ( @combo ) {
        my $neg = -$_;
        if ( grep /^$neg$/, @combo ) {
            $stop = 1;
            last;
        }
    }
    if ( $stop == 0 ) {
        my $combinat = Math::Combinatorics->new(count => 3,
                                                data => [@combo],
                                               );
        while ( my @permu = $combinat->next_permutation) {
            print "@permu\n";
        }
    }
}

