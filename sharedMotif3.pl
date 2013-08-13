use strict;
use Algorithm::LCSS qw( LCSS CSS CSS_Sorted );
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

my $long = CSS_Sorted( $seq[0], $seq[1] );
print "$long\n";
