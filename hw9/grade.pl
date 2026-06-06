#!/usr/bin/perl
use strict;
use warnings;

my @colsum;
my $count = 0;
my $ncols = 0;

while (my $line = <STDIN>) {
    chomp $line;
    my @fields = split(/\s+/, $line);

    if ($. == 1) {
        $ncols = scalar @fields;
        printf "%-8s" x $ncols . "%-8s%-8s\n", @fields, "총점", "평균";
        next;
    }

    my $total = 0;
    printf "%-8s%-8s", $fields[0], $fields[1];
    for my $i (2 .. $#fields) {
        printf "%4d    ", $fields[$i];
        $total += $fields[$i];
        $colsum[$i] += $fields[$i];
    }
    my $avg = $total / ($#fields - 1);
    printf "%6d %6.1f\n", $total, $avg;
    $count++;
}

printf "%16s", "";
for my $i (2 .. $ncols - 1) {
    printf "%4.1f    ", $colsum[$i] / $count;
}
print "\n";
