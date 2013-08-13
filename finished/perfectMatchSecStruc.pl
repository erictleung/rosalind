#!/usr/bin/perl -w

# Program 'perfectMatchSecStruc'
# Given: An RNA string 's' of length at most 80 bp having the same
#     number of occurrences of 'A' as 'U' and the same number of
#     occurrences of 'C' as 'G'
# Return: The total possible number of perfect matchings of basepair
#     edges in the bonding graph of 's'

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $waste = <IN1>; # Waste
my $seq = "";
while ( <IN1> ) {
    chomp;
    $seq .= $_;
}
my @arr = split "", $seq;

my $a = 0;
foreach ( @arr ) {
    if ( $_ eq 'A' ) {
        $a++;
    }
}
my $c = 0;
foreach ( @arr ) {
    if ( $_ eq 'C' ) {
        $c++;
    }
}

print "$a $c\n";

$a = &fact($a);
$c = &fact($c);
print $a*$c, "\n";
close IN1;

sub fact {
    my ($n) = @_;
    my $fact = 1;
    for ( my $i = 1; $i <= $n; $i++ ) {
        $fact *= $i;
    }
    $fact;
}
