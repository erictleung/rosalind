#!/usr/bin/perl

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "input error\n";

# Given: At most 10 DNA DNA strings in FASTA format of length at most 1 kbp each
# Return: The ID of the string having the highest GC-content, followed by the
#     GC-content of that string. Rosalind allows for a default error of 0.001
#     in all decimal answers unless otherwise stated; please see the note on
#     absolute error below.

my %hash;
my $seq = "";
my $gc = 0;
my @array;
my $length = 0;
my $percent = 0;
my $name;

while ( <IN1> ) {
    chomp;
    if ( />(.*)/ ) {
        if ( length ($seq) > 0 ) {
            $length = length ($seq);
            $gc = 0;
            @array = split "", $seq;
            foreach ( @array ) {
                if ( $_ eq 'C' or $_ eq 'G' ) {
                    $gc += 1;
                }
            }
            $percent = $gc / $length * 100;
            $hash{$name} = $percent;
            $name = $1;
            $seq = "";
        }
        else {
            $seq = "";
            $name = $1;
            $gc = 0;
        }
    }
    else {
        $seq .= $_;
    }
}

$gc = 0;
$length = length ($seq);
@array = split "", $seq;
foreach ( @array ) {
    if ( $_ eq 'C' or $_ eq 'G' ) {
        $gc += 1;
    }
}
$percent = $gc / $length * 100;
$hash{$name} = $percent;

close IN1;

my $greatest = "";
my $greatLen = 0;
my $key;

foreach $key ( keys %hash ) {
    if ( $hash{$key} > $greatLen ) {
        $greatest = $key;
        $greatLen = $hash{$key};
    }
}

print "$greatest\n";
print "$hash{$greatest}\n";
