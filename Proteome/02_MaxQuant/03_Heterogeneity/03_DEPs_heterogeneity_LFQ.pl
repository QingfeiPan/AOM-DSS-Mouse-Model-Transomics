#!/usr/bin/perl

use strict;
use warnings;

open (REF1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_razor_LFQ.txt") or die;
my %deps1 = ();
while (<REF1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    $deps1{$F[0]} = $F[13];
}
close REF1;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/02_protein_foldchange_LFQ_unique_razor.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/03_DEPs_heterogeneity_LFQ_unique_razor.txt") or die;
print OUT1 "Protein_ID\tRegulationType\tFrequency\tFoldChange1\tFoldChange2\tFoldChange3\tFoldChange4\tFoldChange5\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    next unless (exists $deps1{$F[0]});
    my ($number_diff, $number_iden) = (0,0);
    for my $x (1 .. 5) {
        $number_diff++ if ($F[$x]>=2 or $F[$x]<=0.5);
        $number_iden++ unless ($F[$x] == 1);
    }
    my $frequency = $number_diff / $number_iden;
    print OUT1 "$F[0]\t$deps1{$F[0]}\t$frequency\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\n";
}
close IN1; close OUT1;

open (REF2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_LFQ.txt") or die;
my %deps2 = ();
while (<REF2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    $deps2{$F[0]} = $F[13];
}
close REF1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/02_protein_foldchange_LFQ_unique.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/03_heterogeneity/03_DEPs_heterogeneity_LFQ_unique.txt") or die;
print OUT2 "Protein_ID\tRegulationType\tFrequency\tFoldChange1\tFoldChange2\tFoldChange3\tFoldChange4\tFoldChange5\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    next unless (exists $deps2{$F[0]});
    my ($number_diff, $number_iden) = (0,0);
    for my $x (1 .. 5) {
        $number_diff++ if ($F[$x]>=2 or $F[$x]<=0.5);
        $number_iden++ unless ($F[$x] == 1);
    }
    my $frequency = $number_diff / $number_iden;
    print OUT2 "$F[0]\t$deps2{$F[0]}\t$frequency\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\n";
}
close IN2; close OUT2;
