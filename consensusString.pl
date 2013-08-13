#!/usr/bin/perl

use warnings;
use strict;

open( IN1, $ARGV[0] ) || die "input error\n";

# Given: A collection of at most 10 DNA strings of equal length (at most
#     1 kbp) in FASTA format.
# Return: A consensus string and profile matrix for the collection. (If 
#     several possible consensus strings exist, then you may return any one
#     of them.)

our @array; # Master list
our $string = "";
our @current;
our $n;

while (<IN1>) {
    chomp;
    if (/>.*/) {
        @current = split "", $string;
        $n = 1;
        while ($n <= scalar @current) {
            if ($current[$n-1] eq 'A') {
                $array[$n-1][0] += 1;
            }
            elsif ($current[$n-1] eq 'C') {
                $array[$n-1][1] += 1;
            }
            elsif ($current[$n-1] eq 'T') {
                $array[$n-1][2] += 1;
            }
            elsif ($current[$n-1] eq 'G') {
                $array[$n-1][3] += 1;
            }
            $n += 1;
        }
        $string = ""; 
    }
    else {
        chomp;
        $string .= $_;
        print $string,"\n";
    }
}

close IN1;

while ($n <= scalar(@current)) {
    if ($current[$n-1] eq 'A') {
        $array[$n-1][0] += 1;
    }
    elsif ($current[$n-1] eq 'C') {
        $array[$n-1][1] += 1;
    }
    elsif ($current[$n-1] eq 'T') {
        $array[$n-1][2] += 1;
    }
    elsif ($current[$n-1] eq 'G') {
        $array[$n-1][3] += 1;
    }
    $n += 1;
}

our %nucl = (
    0 => 'A',
    1 => 'C',
    2 => 'T',
    3 => 'G'
);

print @array,"\n";

our $consensus;
foreach my $ref (@array) {
    our $great = 0;
    our $base = 0;
    foreach my $ele (@$ref) {
        my $i = 0;
        if ($ele >= $great) {
            $great = $_;
            $base = $i;
        }
        $i += 1;
    $consensus .= $nucl{$base}; 
    }
}


print $consensus,"\n";

# print "A: ";
# foreach my $l (0..$#array) {
#   print $array[$l][0]," ";
# }
# print "\n";
