#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/05_foldchange_compare/03_Foldchange_matrix_for_scatter_UR.txt") or die;
my %ref = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    $ref{$F[0]} = "$F[1]\t$F[4]";
}
close REF;

open (IN, "/leofs/wulin_group/zhangcm/ref/KEGG2015_human_by_pathway.txt") or die;
while (<IN>) {
    chomp;
    next if ($_ =~ /^KEGG/);
    my @F = split(/\t/, $_);
    my $tag = (split(/:/, $F[0]))[0];
    open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/06_pathway_enrichment/02_correlation_bypathway/$tag\_input.txt") or die;
    print OUT "Gene\tFPKM\tLFQ\n";
    my $gene_number = 0;
    my @G = split(/\|/, $F[4]);
    for my $x (@G) {
        if (exists $ref{$x}) {
            print OUT "$x\t$ref{$x}\n";
            $gene_number++;
        }
        else {
            next;
        }
    }
    close OUT;
    `rm /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/06_pathway_enrichment/02_correlation_bypathway/$tag\_input.txt` if ($gene_number < 3);
}
close IN;
