#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/ref/Gene_homology_mouse_to_human.txt") or die;
my %gene = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /^#/);
    my @F = split(/\t/, $_);
    if ($F[1] =~ /,/) {
        $gene{$F[0]} = (split(/,/, $F[1]))[0];
    }
    else {
        $gene{$F[0]} = $F[1];
    }
}
close REF;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/11_abundance_matrix_protein_UR.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/01_Abundance_matrix_mouse_UR.txt") or die;
print OUT1 "GeneSymbol\tMouse_N1\tMouse_N2\tMouse_N3\tMouse_N4\tMouse_N5\tMouse_N6\tMouse_T1\tMouse_T2\tMouse_T3\tMouse_T4\tMouse_T5\tMouse_T6\n";
my ($identified, $transformed) = (0,0);
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    my $sum = ($F[1] + $F[2] +$F[3] + $F[4] + $F[5] + $F[6] + $F[7] + $F[8] + $F[9] + $F[10]);
    next if ($sum == 0);
    $identified++;
    next unless (exists $gene{$F[0]});
    print OUT1 "$gene{$F[0]}\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\n";
    $transformed++;
}
close IN1; close OUT1;
my $r = ($transformed / $identified);
print "$transformed of $identified($r) genes have homology items in human!\n";
