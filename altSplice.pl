#!/usr/bin/perl -w

# Program 'altSplice'
# Given: Positive integers n and m with 0 <= m <= n <= 2000
# Return: The sum of the combinations for all k satisfying 
#     m <= k <= n mod 1,000,000

open ( IN1, $ARGV[0] ) || die "Input error.\n";

my @ar = split " ", <IN1>;
my $n = $ar[0];
my $m = $ar[1];
my $sum = 0;

for ( $m; $m <= $n; $m++) {
    $sum += &com($n, $m); # Adding number of combinations
    $sum %= 1000000; # Modulo 1,000,000
}
print $sum,"\n";

#-------------------------------------------------------

sub com {
    my ($n, $k) = @_;
    my $diff = $n - $k;
    my $com = &fact($n) / ( &fact($k) * &fact($diff) );
    return $com;
}

sub fact {
    my ($n) = @_;
    my $fact = 1;
    for ( my $m = 1; $m <= $n; $m++ ) {
        $fact *= $m;
    }
    $fact;
}
