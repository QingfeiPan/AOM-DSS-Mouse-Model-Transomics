#!/usr/bin/perl

use strict;
use warnings;
use Text::NSP::Measures::2D::Fisher::right;

open (IN, "/leofs/wulin_group/zhangcm/panqf/rna/05_DEGs/01_gene/05_pathway/01_s1_DEGs_array_for_FET.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/rna/05_DEGs/01_gene/05_pathway/01_s2_Fisher_Exact_Test.txt.txt") or die;

while (<IN>) {
    chomp;
    next if ($_ =~ /^Pathway/);
    my @F = split(/\t/,$_);
    my $n11 = $F[1]; my $n21 = $F[2]; my $n12 = $F[3]; my $n22 = $F[4];
    my $npp = ($n11 + $n21 + $n12 + $n22);
    my $n1p = ($n11 + $n12);
    my $np1 = ($n11 + $n21);
    my $p = 0;
    if ($npp == 0) {
        $p = 1;
    }
    else {
        $p = calculateStatistic(n11=>$n11, n1p=>$n1p, np1=>$np1, npp=>$npp);
    }
    print OUT "$F[0]\t$p\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\n";
}
close IN;
close OUT;

