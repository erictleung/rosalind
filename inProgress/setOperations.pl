#!/usr/bin/perl -w

# Program 'setOperations'
# Given: A positive integer n ( n<= 20,000 ) and two subsets A and B
#    of {1,2,...,n}
# Return: Six sets
#    A union B         A intersect B
#    A - B             B - A
#    A Complement      B Complement

use strict;

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my $n = <IN1>; # Take in integer 'n'
chomp $n;

my $A = <IN1>; # Take in Set A
chomp $A;
$A = substr $A, 1, length($A)-2; # Take only numbers, no brackets
my @Aray = split ", ", $A; # Put into Array A

my $B = <IN1>; # Take in Set B
chomp $B;
$B = substr $B, 1, length($B)-2; # Take only numbers, no brackets
my @Bray = split ", ", $B; # Put into Array B

# UNION OF A AND B
my @AORB = (@Aray, @Bray);
my %hashAORB;
foreach ( @AORB ) {
    $hashAORB{$_} = 1;
}
@AORB = keys(%hashAORB);
&output(@AORB);

# INTERSECT OF A AND B
my @AANDB;
my %hashA;
foreach ( @Aray ) { 
    $hashA{$_} = 1;
}
foreach ( @Bray ) {
    if ($hashA{$_}) {
        push @AANDB, $_;
    }
}
&output(@AANDB);

# A - B
my @AMINUSB;
my %hashA2 = %hashA;
foreach ( @Bray ) {
    if ( $hashA2{$_} ) {
        delete $hashA2{$_};
    }
}
@AMINUSB = keys(%hashA2);
&output(@AMINUSB);

# B - A
my @BMINUSA;
my %hashB;
foreach ( @Bray ) {
    $hashB{$_} = 1;
}
my %hashB2 = %hashB;
foreach ( @Aray ) {
    if ( $hashB2{$_} ) {
        delete $hashB2{$_};
    }
}
@BMINUSA = keys(%hashB2);
&output(@BMINUSA);

# A COMPLEMENT
my @ACOMP;
my @all;
for ( my $k = 1; $k <= $n; $k++ ) {
    push @all, $k;
}
my %hashAll;
foreach ( @all ) {
    $hashAll{$_} = 1;
}
my %hashAll2 = %hashAll;
foreach ( @Aray ) {
    if ( $hashAll2{$_} ) {
        delete $hashAll2{$_};
    }
}
@ACOMP = keys(%hashAll2);
&output(@ACOMP);

# B COMPLEMENT
my @BCOMP;
my %hashAll3 = %hashAll;
foreach ( @Bray ) {
    if ( $hashAll3{$_} ) {
        delete $hashAll3{$_};
    }
}
@BCOMP = keys(%hashAll3);
&output(@BCOMP);

#------------------------------------------

sub output { # Take in array
    my (@arr) = @_;
    my $str = join ", ", @arr;
    print "\{$str\}\n";
}
