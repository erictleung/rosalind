#!/usr/bin/perl -w

# Work for ORF problem

use strict;

$_ = "friend food fond found"; # Test string
my @matches = $_ =~ /(f.*?)d/g; # find 'f' and end with 'd' using RegEx

print "@matches\n"; # Print matches
print "-" x 30,"\n";

$_ = "frfiedfad"; # New test string
push @matches, $_ =~ /(f.*?)d/g; # Using RegEx again
print "@matches\n"; 
print "-" x 30,"\n";

# Test string closer to ORF problem
$_ = "frifrifrifreedtafriedstethe"; # Multiple 'f's before 'd' 
push @matches, $_  =~ /^(f.*?)/g;
print "@matches\n";
print "-" x 30,"\n";

my $i = 0; # Index 0 element
my @a; # Make indices for where 'fri' are
while ( 1 ) { # Just continue running until is doesn't find anymore
    my $m = index ( $_, 'fri', $i ); # Search by index
    if ( $m == -1 ) { # If 'fri' isn't found
        last; # Escape 'while' loop
    }
    else {
        print "$m\n"; # Print index where 'fri' is
        push @a, $m; # Push to master array
        $i = $m+1; # Move search starting from next element
    }
}
print "-" x 30,"\n";

print "From 'fri' to end\n";
my $jk = $_;
foreach ( @a ) {
    my $s = substr $jk, $_, length($jk)-$_;
    print $s,"\n";
}
print "-" x 30,"\n";

print "Testing &string subroutine\n";
print "Indices: @a\n";
my @ar = &string($jk,@a);
print "@ar\n";
print "-" x 30,"\n";

print "Using regex\n";
my @one;
foreach ( @ar ) {
    my $seq;
    if ( /(fri.*)d/g) {
        $seq = $1;
    }
    print "$seq\n";
    push @one, $seq;
}
print "-" x 30,"\n";

print "Choosing seq from 'fri' to 'd'\n";
my @endIndex;
foreach ( @ar ) {
    my $end = index $_, 'd', 0;
    my $use = substr $_, 0, $end;
    print "$use\n";
}

print "\nThis is the seq: $_\n";
print "This is what I want:\n";
print "frifrifrifree\n";
print "frifrifree\n";
print "frifree\n";
print "frie\n";


# &string to give back seq start at index to end
sub string { # Input: string, array
    my ($string, @array) = @_;
    my @arr;
    foreach ( @array ) {
        my $s = substr $string, $_, length($string)-$_;
#       print $s,"\n";
        push @arr, $s;
    }
    return @arr;
}
