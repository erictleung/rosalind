#!/usr/bin/perl -w

# Program 'orf'
# Given: A DNA String s of length at most 1 kbp in FASTA format
# Return: Every distinct candidate protein string that can be 
#     translated from ORFs of s. Strings can be returned in any order

# NOTE: Will output all ORFs, not necessarily unique
#       Will need to perform terminal command: OUTPUT | sort | uniq
#           to get unique ORFs

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $seq = <IN1>; # Discard first line
$seq = <IN1>; # Read second line
chomp $seq;
while ( <IN1> ) { # Because FASTA format...
    chomp; # Remove new line character
    $seq .= $_; # Cancatenate string into on
}

$seq =~ s/T/U/g; #Translate to mRNA

# Amino acid codon table
my %hash = (
    'UUU' => 'F',  'UCU' => 'S',  'UAU' => 'Y',    'UGU' => 'C',
    'UUC' => 'F',  'UCC' => 'S',  'UAC' => 'Y',    'UGC' => 'C',
    'UUA' => 'L',  'UCA' => 'S',  'UAA' => 'STOP', 'UGA' => 'STOP',
    'UUG' => 'L',  'UCG' => 'S',  'UAG' => 'STOP', 'UGG' => 'W',
    'CUU' => 'L',  'CCU' => 'P',  'CAU' => 'H',    'CGU' => 'R',
    'CUC' => 'L',  'CCC' => 'P',  'CAC' => 'H',    'CGC' => 'R',
    'CUA' => 'L',  'CCA' => 'P',  'CAA' => 'Q',    'CGA' => 'R',
    'CUG' => 'L',  'CCG' => 'P',  'CAG' => 'Q',    'CGG' => 'R',
    'AUU' => 'I',  'ACU' => 'T',  'AAU' => 'N',    'AGU' => 'S',
    'AUC' => 'I',  'ACC' => 'T',  'AAC' => 'N',    'AGC' => 'S',
    'AUA' => 'I',  'ACA' => 'T',  'AAA' => 'K',    'AGA' => 'R',
    'AUG' => 'M',  'ACG' => 'T',  'AAG' => 'K',    'AGG' => 'R',
    'GUU' => 'V',  'GCU' => 'A',  'GAU' => 'D',    'GGU' => 'G',
    'GUC' => 'V',  'GCC' => 'A',  'GAC' => 'D',    'GGC' => 'G',
    'GUA' => 'V',  'GCA' => 'A',  'GAA' => 'E',    'GGA' => 'G',
    'GUG' => 'V',  'GCG' => 'A',  'GAG' => 'E',    'GGG' => 'G'
);

# Start codon: AUG
# Stop codong: UAG, UGA, UAA

# index STR, SUBTR, POSITION
# subtr STR, OFFSET, LENGTH

&orf($seq);
$seq = &revComp($seq);
&orf($seq);

# -----------------------SUBROUTINES----------------------
# --------------------------------------------------------

# OPEN READING FRAME WORKFLOW
sub orf {
    my ($seq) = @_; # Take in DNA sequence

    my @index = &startCodon($seq); # Find indices with AUG start

    my @firstSeq = &strings($seq, @index); # Array with index to end of str

    my @secSeq; # Prepare to put in strings with stop accounted

    foreach ( @firstSeq ) { # Loop over elements
        my $kj = &endIndex($_); # Save seq ORF including stop codon
        push @secSeq, $kj; # Push to array used for storage
    }

    my @goodSeq = &mult3( @secSeq ); # Check length is multiple of 3

    foreach ( @goodSeq ) { # Loop over elements
        print &translate( $_ ),"\n"; # Translate to Amino Acids
    }
}

# CHOOSE BY STOP CODON
sub endIndex { # Take in string with AUG start
    my $seqLen = length($_);
    my $end1 = index $_, 'UAG', 0;
    until ( $end1 % 3 == 0 || $end1 == -1 ) {
        $end1 += 1;
        $end1 = index $_, 'UAG', $end1;
    }
    my $end2 = index $_, 'UGA', 0;
    until ( $end2 % 3 == 0 || $end2 == -1 ) {
        $end2 += 1;
        $end2 = index $_, 'UGA', $end2;
    }
    my $end3 = index $_, 'UAA', 0;
    until ( $end3 % 3 == 0 || $end3 == -1 ) {
        $end3 += 1;
        $end3 = index $_, 'UAA', $end3;
    }
    my @all = ($end1, $end2, $end3);
    my $use = length($_);
    for ( my $n = 0; $n < 3; $n++ ) {
        if ( $use > $all[$n] && $all[$n] != -1 ) {
            $use = $all[$n];
        }
        else {
            next;
        }
    }
    if ( $use == $seqLen ) {
        return 0;
    }
    else {
        my $newSeq = substr $_, 0, $use;
        return $newSeq; # Return seq with AUG start and seq before stop
    }
}

# REVERSE COMPLEMENT 
sub revComp { # Return reverse complement
    my ($seq) = @_;
    my @string = split "", $seq; # Split DNA seq into array elements
    my @new; # Make array to store reverse complement
    foreach ( @string ) { # Loop over DNA seq array
        if ( $_ eq 'A' ) {
            unshift @new, 'U';
        }
        elsif ( $_ eq 'C' ) {
            unshift @new, 'G';
        }
        elsif ( $_ eq 'U' ) {
            unshift @new, 'A';
        }
        elsif ( $_ eq 'G' ) {
            unshift @new, 'C';
        }
    }
    $seq = join "", @new; # Combine new rev comp DNA seq
    return $seq; # Returns string of rev complement
}

# CHECK IF SEQUENCES IN ARRAY HAVE LENGTH MULTIPLE OF 3
sub mult3 { # Given: Array of sequences to check length
    my (@arr) = @_; # Move input into array
    my @good; # Array of seq with mult of 3 base length
    foreach ( @arr ) { # Loop over elements in array
        if (length($_) % 3 == 0) {
            push @good, $_; # Add to array if good
        }
        else {
            next; # Do nothing if does not meet length parameter
        }
    }
    return @good;
}

# TRANSLATE STRING TO AMINO ACIDS
sub translate { # Translated strings to AA
    my $protein;
    for (my $i=0; $i<length($_[0])-2; $i+=3) {;
        my $codon = substr($_[0], $i, 3);
        if ( $hash{$codon} eq "STOP" ) {
            last;
        }
        else {
            $protein .= $hash{$codon};
        }
    }
    return $protein;
}

sub startCodon { # Takes in string and finds start codons
    my $i = 0;
    my @a;
    while ( 1 ) {
        my $m = index ( $_[0], 'AUG', $i );
        if ( $m == -1 ) {
            last;
        }
        else {
            push @a, $m;
            $i = $m + 1;
        }
    }
    return @a; # Return array of indices of start codon
}

sub strings { # Input string, array
    my ($string, @array) = @_;
    my @a; # New array to keep strings
    foreach ( @array ) { # Loop over elements
        my $s = substr $string, $_, length($string)-$_; # Index to end
        push @a, $s; # Push into array storage
    }
    return @a; # Return array of strings start with AUG
}
