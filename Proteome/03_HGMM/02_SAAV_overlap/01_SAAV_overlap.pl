#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/02_SAAV_overlap";
open (REF, "$dir/01_SAAVs_in_human.txt") or die;
my %human = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /^SAAV/);
    my @F = split(/\t/, $_);
    my @G = split(/\|/, $F[3]);
    $human{$G[3]} = "$G[3]\t$F[0]\t$F[9]";
}
close REF;

open (IN, "$dir/01_SAAVs_in_mouse.txt") or die;
open (OUT, "> $dir/01_SAAV_overlap.txt") or die;
print OUT "Gene_Mouse\tSAAV_Mouse\tSpectraCount_Mouse\tGene_Human\tSAAV_Human\tSpectraCount_Human\n";
while (<IN>) {
    chomp;
    next if ($_ =~ /^ProteinID/);
    my @F = split(/\t/, $_);
    my $tag = uc($F[2]);
    if (exists $human{$tag}) {
        print OUT "$F[2]\t$F[0]:$F[1]\t$F[8]\t$human{$tag}\n";
    }
}
close IN; close OUT;
