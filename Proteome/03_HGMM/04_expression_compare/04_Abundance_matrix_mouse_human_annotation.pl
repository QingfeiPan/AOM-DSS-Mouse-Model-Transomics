#!/usr/bin/perl

use strict;
use warnings;

open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/04_Abundance_matrix_mouse_human_annotation.txt") or die;
print OUT "SampleID\tSpecies\tType\tType2\n";

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/01_sample_group_mss.txt") or die;
while (<IN1>) {
    chomp;
    next unless ($_ =~ /^GeneSymbol/);
    my @F = split(/\t/, $_);

    for(my$i=1;$i<@F;$i++) {
        $F[$i] =~ s/-/\./g;
        if ($F[$i] =~ /^JX/) {
            print OUT "$F[$i]\tHuman\tNormal\tUnknown\n";
        }
        else {
            print OUT "$F[$i]\tHuman\tTumor\tMSS\n";
        }
    }
}
close IN1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/01_sample_group_msi.txt") or die;
while (<IN2>) {
    chomp;
    next unless ($_ =~ /^GeneSymbol/);
    my @F = split(/\t/, $_);

    for(my$i=1;$i<@F;$i++) {
        $F[$i] =~ s/-/\./g;
        if ($F[$i] =~ /^JX/) {
            next;
        }
        else {
            print OUT "$F[$i]\tHuman\tTumor\tMSI\n";
        }
    }
}
close IN2;

print OUT "TCGA.AA.3558.01A.22\tHuman\tTumor\tUnknown\n";
print OUT "TCGA.AA.3695.01A.22\tHuman\tTumor\tUnknown\n";
print OUT "Mouse_N1\tMouse\tNormal\tUnknown\n";
print OUT "Mouse_N2\tMouse\tNormal\tUnknown\n";
print OUT "Mouse_N3\tMouse\tNormal\tUnknown\n";
print OUT "Mouse_N4\tMouse\tNormal\tUnknown\n";
print OUT "Mouse_N5\tMouse\tNormal\tUnknown\n";
print OUT "Mouse_T1\tMouse\tTumor\tUnknown\n";
print OUT "Mouse_T2\tMouse\tTumor\tUnknown\n";
print OUT "Mouse_T3\tMouse\tTumor\tUnknown\n";
print OUT "Mouse_T4\tMouse\tTumor\tUnknown\n";
print OUT "Mouse_T5\tMouse\tTumor\tUnknown\n";
close OUT;
