#!/usr/bin/perl

# Program 'stringAndLists'
# Given: A string s of length at most 200 letters and four integers
#     a, b, c, d
# Return: The slice of this string from indices a through b and c through
#     d (with space in between), inclusively
use strict;
use warnings;

open( IN1, $ARGV[0] ) || die "input error.\n";

my $message = <IN1>;
chomp $message;
my @str2 = split " ", <IN1>;

my $one = $str2[1] - $str2[0] + 1; # Plus one for 1 based numbering
my $two = $str2[3] - $str2[2] + 1; # for lists

# substr STRING, BEGIN, LENGTH

my $word1 = substr $message, $str2[0], $one;
my $word2 = substr $message, $str2[2], $two;

print "$word1 $word2\n";

close IN1;
