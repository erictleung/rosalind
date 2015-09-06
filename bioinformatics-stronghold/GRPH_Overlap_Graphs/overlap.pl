#!/usr/bin/perl -w

# The 'overlap' program is to find overlaps between sequences
# Given: A collection of DNA strings in FASTA format having total
#     length at most 10 kbp.
# Output: The adjacency list corresponding to O_3.

open ( IN1, $ARGV[0] ) || die "input error\n";

my %seq;
my $name = "";
my $sequence = "";

# Putting sequences into hash
while ( <IN1> ) {
    chomp;
    if ( />(.*)/ ) {
        if ( $name ne "" ) {
            $seq{$name} = $sequence;
            $sequence = "";
            $name = $1;
        }
        else {
            $name = $1;
        }
    }
    else {
        $sequence .= $_;
    }
}

$seq{$name} = $sequence;

foreach ( keys %seq ) {
    my $seq1 = $seq{$_};
    my $name1 = $_;
    my $seq2;
    my $name2;
    foreach ( keys %seq ) {
        $seq2 = $seq{$_};
        $name2 = $_;
        if ( $name1 eq $name2 ) {
            next;
        }
        else {
            if ( (substr $seq1, -3,3) eq (substr $seq2, 0, 3) ) {
                print "$name1 $name2\n";
            }
        }
    }
}

close IN1;
