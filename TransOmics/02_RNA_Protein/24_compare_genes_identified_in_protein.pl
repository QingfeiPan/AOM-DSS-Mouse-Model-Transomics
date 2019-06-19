#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/01_abundance_matrix_protein.txt") or die;
my %gene = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    $gene{$F[0]}++;
}
close REF;

open (IN, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/01_abundance_matrix_mrna.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/24_compare_genes_identified_in_protein_yes.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/24_compare_genes_identified_in_protein_no.txt") or die;
while (<IN>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    my ($sum, $num) = (0, 0);
    for(my$i=1;$i<@F;$i++) {
        $sum += $F[$i];
        $num++ unless ($F[$i] == 0);
    }
    my $abundance = ($sum / $num);
    if (exists $gene{$F[0]}) {
        print OUT1 "$F[0]\t$abundance\n";
    }
    else {
        print OUT2 "$F[0]\t$abundance\n";
    }
}
close IN; close OUT1; close OUT2;
