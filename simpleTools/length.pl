#!/usr/bin/perl -w

# Program 'length.pl'
# Takes in user input to calculate length of string

print "What string would you like the length of?: \n";
my $in = <STDIN>;
chomp $in;
print "Length is ",length($in),"\n";
my $mod = length($in) % 3;
print "Mod 3 is $mod\n";
