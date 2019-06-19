#!/usr/bin/perl

use strict;
use warnings;

my %genes = ();
open (REF1, "/leofs/wulin_group/zhangcm/panqf/rna/05_DEGs/01_gene/04_summary/04_DEGs_summary_gene_total.txt") or die;
while (<REF1>) {
    chomp;
    my @F = split(/\t/, $_);
    $genes{$F[0]}++;
}
close REF1;

open (REF2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/06_protein_to_genenames_unique_razor_LFQ.txt") or die;
while (<REF2>) {
    chomp;
    my @F = split(/\t/, $_);
    $genes{$F[1]}++;
}
close REF2;

open (IN, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/13_abundance_summary_overlap_UR.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/21_abundance_matrix_DEGs_DEPs_overlap.txt") or die;
while (<IN>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Gene/) {
        print OUT "$_\n";
    }
    else {
        next unless (exists $genes{$F[0]});
        print OUT "$_\n" if ($genes{$F[0]} == 2);
    }
}
close IN; close OUT;
