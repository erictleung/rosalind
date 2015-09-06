use strict;
my @a;
$a[0] = 1;
$a[1] = 2;
$a[3] = 5;
print $a[2],"\n";
if ($a[2] == 0) {
   print "Match!\n";
}
if ($a[8] == 0) {
   print "Match!\n";
}

$a[2] += 1;
print $a[2],"\n";
print "\n";

my @tgs = (
    ['article series', 'sed & awk', 'troubleshooting', 'vim', 'bash'],
    ['ebooks', 'linux 101', 'vim 101', 'nagios core', 'bash 101'],
    ['how', 'are', 'you', 'today']
);

print $tgs[0][1],"\n";

print $#tgs,"\n";
print "\n";

@_ = (1, 2, 3, 4, 5);
foreach my $c (0..$#_) {
    print $c,"\n";
}
print "\n";

print @_,"\n";
print "@_\n\n";

print "A: ";
print "Hello";
print "\n\n";

for (our $m = 0; $m <= 4; $m++) {
   while ($m < 3) {
       print "Hello\n";
       last;
   }
   print $m,"\n";
}

print "\n",0..3,"\n\n";

our @array = (
    ["Homer", "Marge", "Bart", "Lisa", "Maggie"],
    ["Ned", "Maude", "Rod", "Todd"]
);

foreach my $ref (@array) {
    print "this family consists of: ";
    foreach (@$ref) {
        print "$_ ";
    }
    print "\n";
}

my @arr;
push @arr, [(0,1,2,3,4) x 5] for 1 .. 3;
print $arr[0][2],"\n";
print @arr,"\n";
