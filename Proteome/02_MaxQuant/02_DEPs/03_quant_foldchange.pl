#!/usr/bin/perl

use strict;
use warnings;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_razor_iBAQ.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_razor_iBAQ.txt") or die;
while (<IN1>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT1 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT1 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT1 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT1 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 2) {print OUT1 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.5) {print OUT1 "$_\t$foldchange\tDown\n";}
            else {print OUT1 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_iBAQ.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_iBAQ.txt") or die;
while (<IN2>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT2 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT2 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT2 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT2 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 2) {print OUT2 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.5) {print OUT2 "$_\t$foldchange\tDown\n";}
            else {print OUT2 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN2; close OUT2;

open (IN3, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s1_quant_extract_unique_razor_LFQ.txt") or die;
open (OUT3, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_razor_LFQ.txt") or die;
while (<IN3>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT3 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT3 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT3 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT3 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 2) {print OUT3 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.5) {print OUT3 "$_\t$foldchange\tDown\n";}
            else {print OUT3 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN3; close OUT3;

open (IN4, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s2_quant_extract_unique_LFQ.txt") or die;
open (OUT4, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_LFQ.txt") or die;
while (<IN4>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT4 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT4 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT4 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT4 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 2) {print OUT4 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.5) {print OUT4 "$_\t$foldchange\tDown\n";}
            else {print OUT4 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN4; close OUT4;

open (IN5, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_razor_TMT.txt") or die;
open (OUT5, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_razor_TMT.txt") or die;
while (<IN5>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT5 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT5 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT5 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT5 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 1.5) {print OUT5 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.67) {print OUT5 "$_\t$foldchange\tDown\n";}
            else {print OUT5 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN5; close OUT5;

open (IN6, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_TMT.txt") or die;
open (OUT6, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_TMT.txt") or die;
while (<IN6>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT6 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT6 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT6 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT6 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 1.5) {print OUT6 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.67) {print OUT6 "$_\t$foldchange\tDown\n";}
            else {print OUT6 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN6; close OUT6;

open (IN7, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_TMT_PD.txt") or die;
open (OUT7, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/03_quant_foldchange_unique_TMT_PD.txt") or die;
while (<IN7>) {
    chomp;
    if ($_ =~ /^Protein_ID/) {print OUT7 "$_\tFoldChange\tRegulation\n";}
    else {
        my @F = split(/\t/, $_);
        my ($normal_group, $tumor_group) = (0, 0);
        for my $x (1 .. 5) {$normal_group++ unless ($F[$x] == 0);}
        for my $y (6 .. 10) {$tumor_group++ unless ($F[$y] == 0);}
        if (($normal_group + $tumor_group) < 2) {print OUT7 "$_\tNA\tNo\n";next;}
        my $foldchange = "NA";
        $foldchange = ((($F[6]+$F[7]+$F[8]+$F[9]+$F[10]) / $tumor_group) / (($F[1]+$F[2]+$F[3]+$F[4]+$F[5]) / $normal_group)) if (($normal_group > 0) and ($tumor_group > 0));
        if ($foldchange eq "NA") {
            print OUT7 "$_\tNA\tUp\n" if ($tumor_group > 0); print OUT7 "$_\tNA\tDown\n" if ($normal_group > 0);
        }
        else {
            if ($foldchange >= 1.5) {print OUT7 "$_\t$foldchange\tUp\n";}
            elsif ($foldchange <= 0.67) {print OUT7 "$_\t$foldchange\tDown\n";}
            else {print OUT7 "$_\t$foldchange\tNo\n";}
        }
    }
}
close IN7; close OUT7;
