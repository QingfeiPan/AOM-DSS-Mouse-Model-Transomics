#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/ref/KEGG2015_mouse_by_pathway.txt") or die;
my %ref = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /^KEGG/);
    my @F = split(/\t/, $_);
    my @G = split(/:/, $F[0]);
    $ref{$G[0]} = "$G[1]\t$F[1]\t$F[2]\t$F[3]";
}
close REF;

open (OUT, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/16_s4_correlation_bypathway_summary.txt") or die;
print OUT "KEGG_ID\tKEGG_Name\tTop_Category\tSub_Category\tGeneNumber_Total\tGeneNumber_Identified\tGeneList_Identified\tPearson_coefficient\tP_Value\n";

opendir (DIR, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/16_correlation_bypathway") or die;
while (my $file = readdir(DIR)) {
    next unless ($file =~ /^(mmu\d+)_output.txt/);
    my $tag = $1;

    open (IN1, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/16_correlation_bypathway/$tag\_input.txt") or die;
    my @gene = ();
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^Gene/);
        my @F = split(/\t/, $_);
        push @gene, $F[0];
    }
    close IN1;

    open (IN2, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/16_correlation_bypathway/$tag\_output.txt") or die;
    my $r = <IN2>; my $p = <IN2>;
    chomp ($r, $p);
    close IN2;

    my $number = scalar @gene;
    my $list = join("\|", @gene);
    print OUT "$tag\t$ref{$tag}\t$number\t$list\t$r\t$p\n";
}
close OUT;
