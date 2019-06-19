#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/01_DEPs_summary_foldchange.txt") or die;
open (OUT, "> /leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/02_DEPs_frequency.txt") or die;

while (<IN>) {
    chomp;
    next if ($_ =~ /^Protein/);
    my @F = split(/\t/, $_);
    my $num = 0;
    for my $i (1 .. 5) {
        $num++ if (($F[$i]<0.33) or ($F[$i]>0.5));
    }
    print OUT "$F[0]\t$num\n";
}
close IN; close OUT;
