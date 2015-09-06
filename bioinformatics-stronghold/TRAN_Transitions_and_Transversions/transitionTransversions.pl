# Program 'transitionTransversions'
# Given:
# Return:

use strict;
use warnings;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my @seq; # This is to hold all of the sequences
my $current = ""; # Working sequence

while ( <IN1> ) {
    chomp; # Remove next line character
    if ( />.*/ ) { # Look for '>' character
        if ( $current eq "" ) { # Just for the initial condition
            next; # Will ignore the first '>' because names not important
        }
        else {
            push ( @seq, $current ); # Add full sequence to array
            $current = ""; # Reset working sequence
        }
    }
    else {
        $current .= $_; # Add to full sequence
    }
}
push ( @seq, $current ); # Add last sequence to array

my @first = split "", $seq[0];
my @sec = split "", $seq[1];

my $sition = 0;
my $version = 0;

for ( my $n = 0; $n <= length($seq[0])-1; $n++ ) {
    if ( $first[$n] eq $sec[$n] ) {
        next;
    }
    my $bi = join ( "", $first[$n], $sec[$n] );
#   print "Pair: $bi\n";
    if ( $bi =~ /(AG)|(GA)|(CT)|(TC)/ ) {
        $sition += 1;
    } 
    else {
        $version += 1;
    }
}

print $sition/$version,"\n";
close IN1;
