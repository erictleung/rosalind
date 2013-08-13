#!/usr/bin/perl -w

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

sub lcss {
     my ($a, $b) = @_;
     my (@x, @y);
     my ($maxLength, $maxXi, $maxXk, $switch) = (0,0,0,0);
     my $returnString;


     my $m = length ( $a );
     my $n = length ( $b );

     if ( $m > $n ) {
          ( $m, $n ) = ( $n, $m );
          ( $a, $b ) = ( $b, $a );
          $switch = 1;
     }

     @x = split ( //, $a );     
     @y = split ( //, $b );     

     #
     # declare varialbes outside of loops for a hair more speed.
     #
     my ( $i, $ii, $j, $k, $length, $xi, $xj );

     for ( $k = 0; $k < $n; $k++ ) {
          #
          # abort if the remainder of the string to check is
          # less than the common substring length already found
          #
          last if ( $maxLength >= ( $m - $k ) );

          ( $xi, $length ) = ( 0, 0 );

          for ( $i = 0; $i < $m; $i++ ) {
               $j = $k;
               $length = 0;
               for ( $ii = 0; $ii < ($m-$i); $ii++ ) {
                    if ( $x[$i+$ii] eq $y[$j] ) {
                         $xi = $i+$ii unless ( $length );
                         $xj = $j unless ( $length );
                         $length++;
                         $j++;
                    }
                    elsif ( $length ) {
                         if ( $length > $maxLength ) {
                              $maxLength = $length;
                              $maxXi = $xi;
                              $maxXk = $xj;
                         }
                         last;
                    }
               }
          }
     }

     if ( $maxLength > 1 ) {
          for ($i = $maxXi; $i < $maxXi+$maxLength; $i++ ) {
               $returnString .= $x[$i];
          }
          ($maxXi, $maxXk) = ($maxXk, $maxXi) if ( $switch );
     }

     ( wantarray ) ? ( $returnString, $maxXi, $maxXk ) :  $returnString;
}


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

my $longest = shift @seq;
foreach ( @seq ) {
    $longest = lcss( $longest, $_ );
    print "$longest\n";
    if ( $longest eq "" ) {
        print "WE GOT EMPTY! NO!\n";
        last;
    }
}

#print $longest,"\n";

 my $longests = lcss ( "zyzxx", "abczyzefg" );
  print $longests, "\n";

  my @result = lcss ( "zyzxx", "abczyzefg" );
  print "$result[0] ($result[1],$result[2])\n";

  my @results = lcss_all ( "ABBA", "BABA" );
  for my $result (@results) {
     print "$result->[0] ($result->[1],$result->[2])\n";
  }

  $longest = lcss ( "foobar", "abcxyzefg", 3 ); #undef
