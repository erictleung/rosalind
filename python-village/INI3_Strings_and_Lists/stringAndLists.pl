#!/usr/bin/perl

# Program 'stringAndLists'
# Given: A string s of length at most 200 letters and four integers
#     a, b, c, d
# Return: The slice of this string from indices a through b and c through
#     d (with space in between), inclusively
# Date: 2015 Sept 18
# Version: 5.16

use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input error.\n";

my $message = <IN1>; # first line is one string
chomp $message; # remove newline character
my @str2 = split " ", <IN1>; # second line has numbers to be split by spaces

close IN1;

# find lengths of strings to extract in next step
my $one = $str2[1] - $str2[0] + 1; # Plus one for 1 based numbering
my $two = $str2[3] - $str2[2] + 1; # for lists

# find actual words between indices indicated in input file
my $word1 = substr $message, $str2[0], $one;
my $word2 = substr $message, $str2[2], $two;
# substr STRING, BEGIN, LENGTH

# save answer in file
open( MYFILE, '> out.txt' );
print MYFILE "$word1 $word2";
close( MYFILE );
