#!/usr/bin/perl -w

# Program 'speedMotifFind'
# Given: A DNA string s (of length at most 10 kbp) in FASTA
# Return: The failure array of s.

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $trash = <IN1>; # Trash the first line being the name
my $seqStr; # Create actual string variable
while ( <IN1> ) { # It's in FASTA format
    chomp; # Remove new line character
    $seqStr .= $_; # Keep on adding the sequence
}

# substr STR, OFFSET, LENGTH

my @fail = (0); # Failure matrix creation

# print "Fail Array: @fail\n"; # Fail array so far
# print "DNA String: $seqStr\n";

my $length = length( $seqStr ) - 1; # Len for index purpose

# print "Length of string by index: $length\n";
# print "-" x 30,"\n";

for ( my $n = 1; $n <= $length; $n++ ) { # Iterating through whole string
   
#   print "Iteration: $n\n";
#   print "Fail Array: @fail\n";
#   print "-" x 30,"\n";
    
    my $prev = $n - 1;
    if ( $n == 1 ) {
        if ( substr($seqStr,0,1) eq substr($seqStr,1,1) ) {
            push @fail, 1;
            
#           print "Second element equals first element.\n";
#           print "-" x 30,"\n"; 
            
        }
        else {
            push @fail, 0;

#           print "Second element does not equal first element.\n";
#           print "-" x 30,"\n";

        }
    }
    elsif ( $fail[$prev] == 0 ) { # Check if element before did not match
        if ( substr( $seqStr, 0, 1 ) eq substr( $seqStr, $n, 1 ) ) { # Check if element matches with first element in string
            push @fail, 1; # Add length of one to failure array
        }
        else {
            push @fail, 0;
        }
    }
    else { # If the previous element had some length
        if ( substr($seqStr,0,$fail[$prev]+1) eq substr($seqStr,$n-$fail[$prev],$fail[$prev]+1) ) { # Check if the element continues pattern from before
            push @fail, $fail[$prev]+1; # Add a 1+ length to the failure array 
        }
        else { # If element doesn't continue pattern

#           print "Didn't continue pattern.\n";
#           print "=" x 30,"\n";

            my $num = 1; # Just an escape variable
            my $ele = 0; # Length
            my $real = 0; # Actual length added to array
            while ( $ele < $n ) {

#               print "*" x 30,"\n";
#               print "Partial Length: $ele\n";
#               print "Position: $n\n";
                
                if ( substr($seqStr,0,$ele+1) eq substr($seqStr,$n-$ele,$ele+1) ) {

#                   print "1\n";

                    $ele++;
                    $real = $ele;
                    last;

#                   print "Real so far: $real\n";
                }
                else {
                    $ele++;
                }
            }
            push @fail, $real;
        }
    }
}

print "@fail\n";
