#!/usr/bin/perl

use strict;
use warnings;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/01_s1_protein_quant_total.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_total.txt") or die;
while (<IN1>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Accession/) {
        print OUT1 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
        next;
    }
    else {
        print OUT1 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
    }
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/01_s2_protein_quant_NMP.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_NMP.txt") or die;
while (<IN2>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Accession/) {
        print OUT2 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
        next;
    }
    else {
        print OUT2 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
    }
}
close IN2; close OUT2;

open (IN3, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/01_s3_peptide_normalized_by_protein_Deglyco.txt") or die;
open (OUT3, "> /leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_Deglyco.txt") or die;
while (<IN3>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Accession/) {
        print OUT3 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
        next;
    }
    else {
        print OUT3 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
    }
}
close IN3; close OUT3;

open (IN4, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/01_s3_peptide_normalized_by_protein_Phospho.txt") or die;
open (OUT4, "> /leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_Phospho.txt") or die;
while (<IN4>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Accession/) {
        print OUT4 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
        next;
    }
    else {
        print OUT4 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[11]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\t$F[12]\n";
    }
}
close IN4; close OUT4;
