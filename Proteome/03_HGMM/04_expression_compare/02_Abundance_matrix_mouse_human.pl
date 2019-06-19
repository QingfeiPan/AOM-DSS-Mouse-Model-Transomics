#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/01_Abundance_matrix_mouse_UR.txt") or die;
my %genes = (); my %mouse = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /Gene/);
    my @F = split(/\t/, $_);
    $genes{$F[0]}++;
    $mouse{$F[0]} = "$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]";
}
close REF;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/02_TCGA_Protein_Normal_Tumor_unlogged.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/02_Abundance_matrix_mouse_human_UR.txt") or die;
while (<IN>) {
    chomp;
    if ($_ =~ /GeneSymbol/) {
        print OUT "$_\tMouse_N1\tMouse_N2\tMouse_N3\tMouse_N4\tMouse_N5\tMouse_T1\tMouse_T2\tMouse_T3\tMouse_T4\tMouse_T5\n";
    }
    else {
        my @F = split(/\t/, $_);
        next unless (exists $mouse{$F[0]});
        print OUT "$_\t$mouse{$F[0]}\n";
    }
}
close IN; close OUT;
