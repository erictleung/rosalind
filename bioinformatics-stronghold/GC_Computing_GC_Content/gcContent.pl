#!/usr/bin/env perl

# Given: At most 10 DNA DNA strings in FASTA format of length at most 1 kbp each
# Return: The ID of the string having the highest GC-content, followed by the
#     GC-content of that string. Rosalind allows for a default error of 0.001
#     in all decimal answers unless otherwise stated; please see the note on
#     absolute error below.

use strict;
use warnings;

# read in input file
open ( IN1, $ARGV[0] ) || die "input error\n";

my %hash;
my $seq = "";
my $gc = 0;
my @array;
my $length = 0;
my $percent = 0; # percent GC-content
my $name;

# loop through input strings
while ( <IN1> ) {
    chomp; # remove trailing spaces
    if ( />(.*)/ ) { # look for caret indicated beginning of sequences
        if ( length ($seq) > 0 ) { # if starting new string
            $length = length ($seq);
            $gc = 0; # reset GC content
            @array = split "", $seq; # split up for easier parsing
            foreach ( @array ) {
                if ( $_ eq 'C' or $_ eq 'G' ) {
                    $gc += 1;
                }
            }
            $percent = $gc / $length * 100; # calculate GC-content percentage
            $hash{$name} = $percent; # add name:GC-content to hash

            $name = $1; # save new sequence name
            $seq = ""; # reset sequence
        }
        else {
            $seq = "";
            $name = $1; # save sequence ID
            $gc = 0;
        }
    }
    else {
        $seq .= $_; # concatenate sequence string together
    }
}

# finish off last line of file
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

# create variables for greatest GC-content sequence
my $greatest = "";
my $greatLen = 0;
my $key;

# loop keys in hash table to find largest GC-content sequence
foreach $key ( keys %hash ) {
    if ( $hash{$key} > $greatLen ) {
        $greatest = $key;
        $greatLen = $hash{$key};
    }
}

# return sequence and its GC-content
print "$greatest\n";
print "$hash{$greatest}\n";
