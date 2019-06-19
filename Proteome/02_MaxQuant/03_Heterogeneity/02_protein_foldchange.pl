#!/usr/bin/perl

use strict;
use warnings;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/01_protein_abundance_LFQ_unique_razor.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/02_protein_foldchange_LFQ_unique_razor.txt") or die;
print OUT1 "Protein_ID\tFoldchange1\tFoldchange2\tFoldchange3\tFoldchange4\tFoldchange5\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    my @array = ();
    for my $j (1 .. 5) {
        my $k = $j + 5;
        my $foldchange;
        if (($F[$j] == 0) and ($F[$k] == 0)) {$foldchange = 1;}
        elsif (($F[$j] == 0) and ($F[$k] > 0)) {$foldchange = 5;}
        elsif (($F[$j] > 0) and ($F[$k] == 0)) {$foldchange = 0.2;}
        elsif (($F[$j] > 0) and ($F[$k] > 0)) {$foldchange = ($F[$k] / $F[$j]);}
        push @array, $foldchange;
    }
    my $line = join("\t", @array);
    print OUT1 "$F[0]\t$line\n";
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/01_protein_abundance_LFQ_unique.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/02_protein_foldchange_LFQ_unique.txt") or die;
print OUT2 "Protein_ID\tFoldchange1\tFoldchange2\tFoldchange3\tFoldchange4\tFoldchange5\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    my @array = ();
    for my $j (1 .. 5) {
        my $k = $j + 5;
        my $foldchange;
        if (($F[$j] == 0) and ($F[$k] == 0)) {$foldchange = 1;}
        elsif (($F[$j] == 0) and ($F[$k] > 0)) {$foldchange = 5;}
        elsif (($F[$j] > 0) and ($F[$k] == 0)) {$foldchange = 0.2;}
        elsif (($F[$j] > 0) and ($F[$k] > 0)) {$foldchange = ($F[$k] / $F[$j]);}
        push @array, $foldchange;
    }
    my $line = join("\t", @array);
    print OUT2 "$F[0]\t$line\n";
}
close IN2; close OUT2;
