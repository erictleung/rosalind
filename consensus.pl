#!/usr/bin/perl -w

# The 'consensus' program
# Given: A collection of at most 10 DNA strings of equal length
#     (at most 1kbp) in FASTA format.
# Output: A consensus string and profile matrix for the collection
#     (If several possible consensus strings exist, then you may
#     return any one of them.)

open ( IN1, $ARGV[0] ) || die "input error.\n";

my $dump = <IN1>; # first line is name of seq
my @first; # first seq, need to use to create consensus length

while ( <IN1> ) {
    chomp;
    if ( />.*/ ) {
        last; # Need to exit so empty consensus can be made
    }
    @sample = split "", $_; 
    @first = (@first, @sample); # adding to whole sequence
}

$length = scalar @first; # need length to make empty arrays
my @consensus; # declare consensus array
my $count = 0;
my @A; # declare adenine counter array
my @C; # declare cytosine counter array
my @T; # declare thymine counter array
my @G; # declare guanine counter array

# Create empty arrays with appropriate length
for ( my $count = 0; $count < $length; $count++ ) {
    @consensus = (@consensus, 0);
    @A = (@A, 0);
    @C = (@C, 0);
    @T = (@T, 0);
    @G = (@G, 0);
}

# Count nucleotides for first sequence extracted
for ( my $count = 0; $count < scalar @consensus; $count++ ) {
    if ( $first[$count] eq "A" ) {
        $A[$count] += 1;
    }
    elsif ( $first[$count] eq "C" ) {
        $C[$count] += 1;
    }
    elsif ( $first[$count] eq "T" ) {
        $T[$count] += 1;
    }
    elsif ( $first[$count] eq "G" ) {
        $G[$count] += 1;
    }
    else {
         print "There is an unusual base here.\n";
    }
}

# Counting nucleotides for rest of file
my @current;
while ( <IN1> ) {
    chomp;
    if ( />.*/ ) { # counting time
        for ( my $count = 0; $count < scalar @consensus; $count++ ) {
            if ( $current[$count] eq "A" ) {
                $A[$count] += 1;
            }
            elsif ( $current[$count] eq "C" ) {
                $C[$count] += 1;
            }
            elsif ( $current[$count] eq "T" ) {
                $T[$count] += 1;
            }
            elsif ( $current[$count] eq "G" ) {
                $G[$count] += 1;
            }
            else {
                print "There is an unusual base here.\n";
            }
        }
    @current = (); # reset current sequence for next one
    }
    else {
        my @hold = split "", $_;
        @current = (@current, @hold); # add on sequence
    }
} 

# Count nucleotides from final sequence in file
for ( my $count = 0; $count < scalar @consensus; $count++ ) {
    if ( $current[$count] eq "A" ) {
        $A[$count] += 1;
    }
    elsif ( $current[$count] eq "C" ) {
        $C[$count] += 1;
    }
    elsif ( $current[$count] eq "T" ) {
        $T[$count] += 1;
    }
    elsif ( $current[$count] eq "G" ) {
        $G[$count] += 1;
    }
    else {
        print "There is an unusual base here.\n";
    }
}

# Make consensus sequence now
$large_base = ""; # Letter of most abundant base
$largest = 0; # Number of times base appears at each position

for ( my $count = 0; $count < scalar @consensus; $count++ ) {
    if ( $A[$count] >= $largest ) {
        $large_base = "A";
        $largest = $A[$count];
    }
    if ( $C[$count] >= $largest ) {
        $large_base = "C";
        $largest = $C[$count];
    }
    if ( $T[$count] >= $largest ) {
        $large_base = "T";
        $largest = $T[$count];
    }
    if ( $G[$count] >= $largest ) {
        $large_base = "G";
        $largest = $G[$count];
    }
    $consensus[$count] = $large_base; # Save most frequent base
    $largest = 0; # Reset largest number
}

# Print output
print @consensus,"\n";
print "A: @A\n";
print "C: @C\n";
print "G: @G\n";
print "T: @T\n";

close IN1;
