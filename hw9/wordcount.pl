#!/usr/bin/perl
use strict;
use warnings;

my %freq;

while (my $word = <STDIN>) {
    chomp $word;
    next if $word eq "";
    $freq{$word}++;
}

print "단어\t\t빈도\n";
print "--------\t----\n";
foreach my $word (sort { $freq{$b} <=> $freq{$a} } keys %freq) {
    printf "%-15s %d\n", $word, $freq{$word};
}
