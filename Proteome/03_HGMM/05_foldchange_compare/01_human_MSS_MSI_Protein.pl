#!/usr/bin/perl

use strict;
use warnings;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/03_Abundance_matrix_mouse_human_normalized_U.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/05_foldchange_compare/01_human_MSS_MSI_Protein_U.txt") or die;
while (<IN1>) {
    chomp;
    my @F = split(/\t/, $_);
    my @array = ();
    for my $i (0 .. 120) {
        push @array, $F[$i];
    }
    my $line = join("\t", @array);
    print OUT1 "$line\n";
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/03_Abundance_matrix_mouse_human_normalized_UR.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/05_foldchange_compare/01_human_MSS_MSI_Protein_UR.txt") or die;
while (<IN2>) {
    chomp;
    my @F = split(/\t/, $_);
    my @array = ();
    for my $i (0 .. 120) {
        push @array, $F[$i];
    }
    my $line = join("\t", @array);
    print OUT2 "$line\n";
}
close IN2; close OUT2;

open (IN3, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/04_Abundance_matrix_mouse_human_annotation.txt") or die;
open (OUT3, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/05_foldchange_compare/01_human_MSS_MSI_Protein_Annotation.txt") or die;
print OUT3 "Sample\tType1\tType2\n";
while (<IN3>) {
    chomp;
    next if ($_ =~ /^SampleID/);
    my @F = split(/\t/, $_);
    next if ($F[0] =~ /^Mouse/);
    print OUT3 "$F[0]\t$F[2]\t$F[3]\n";
}
close IN3; close OUT3;
