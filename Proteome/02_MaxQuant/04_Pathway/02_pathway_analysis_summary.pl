#!/usr/bin/perl

use strict;
use warnings;

open (REF1, "/leofs/wulin_group/zhangcm/ref/KEGG2015_mouse_by_pathway.txt") or die;
my %group = ();
while (<REF1>) {
    chomp;
    next if ($_ =~ /^KEGG/);
    my @F = split(/\t/, $_);
    $group{$F[0]} = "$F[1]\t$F[2]";
}
close REF1;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s3_FDR_BH_unique.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/02_pathway_analysis_summary_unique.txt") or die;
print OUT1 "Pathway\tID\tName\tPvalue\tQvalue\tCategory\tSubcategory\tDEGs_Number\tGene_Number\tRichFactor\n";
while (<IN1>) {
    chomp;
    next unless ($_ =~ /^mmu/);
    my @F = split(/\t/, $_);
    my @G = split(/:/, $F[0]);
    my $richfactor = ($F[3] / $F[5]);
    print OUT1 "$F[0]\t$G[0]\t$G[1]\t$F[1]\t$F[2]\t$group{$F[0]}\t$F[3]\t$F[5]\t$richfactor\n";
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s3_FDR_BH_unique_razor.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/02_pathway_analysis_summary_unique_razor.txt") or die;
print OUT2 "Pathway\tID\tName\tPvalue\tQvalue\tCategory\tSubcategory\tDEGs_Number\tGene_Number\tRichFactor\n";
while (<IN2>) {
    chomp;
    next unless ($_ =~ /^mmu/);
    my @F = split(/\t/, $_);
    my @G = split(/:/, $F[0]);
    my $richfactor = ($F[3] / $F[5]);
    print OUT2 "$F[0]\t$G[0]\t$G[1]\t$F[1]\t$F[2]\t$group{$F[0]}\t$F[3]\t$F[5]\t$richfactor\n";
}
close IN2; close OUT2;
