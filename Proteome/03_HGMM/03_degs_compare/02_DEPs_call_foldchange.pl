#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare";

open (IN1, "$dir/01_DEPs_call_pvalue_Total.txt") or die;
open (OUT1, "> $dir/02_DEPs_call_foldchange_Total.txt") or die;
while (<IN1>) {
    chomp;
    if ($_ =~ /^P_value/) {
        print OUT1 "GeneSymbol\tFoldChange\t$_\n";
    }
    else {
        my @F = split(/\t/, $_);
        my ($number_normal, $number_tumor, $sum_normal, $sum_tumor) = (0, 0, 0, 0);
        for my $i (2 .. 31) {
            next if ($F[$i] == 1);
            $number_normal++; $sum_normal += $F[$i];
        }
        for my $i (32 .. 121) {
            next if ($F[$i] == 1);
            $number_tumor++; $sum_tumor += $F[$i];
        }
        my $foldchange = (($sum_tumor/$number_tumor) / ($sum_normal/$number_normal));
        my @array = ();
        for my $i (1 .. 121) {
            push @array, $F[$i];
        }
        my $line = join("\t", @array);
        print OUT1 "$F[0]\t$foldchange\t$line\n";
    }
}
close IN1; close OUT1;

open (IN2, "$dir/01_DEPs_call_pvalue_MSS.txt") or die;
open (OUT2, "> $dir/02_DEPs_call_foldchange_MSS.txt") or die;
while (<IN2>) {
    chomp;
    if ($_ =~ /^P_value/) {
        print OUT2 "GeneSymbol\tFoldChange\t$_\n";
    }
    else {
        my @F = split(/\t/, $_);
        my ($number_normal, $number_tumor, $sum_normal, $sum_tumor) = (0, 0, 0, 0);
        for my $i (2 .. 31) {
            next if ($F[$i] == 1);
            $number_normal++; $sum_normal += $F[$i];
        }
        for my $i (32 .. 89) {
            next if ($F[$i] == 1);
            $number_tumor++; $sum_tumor += $F[$i];
        }
        my $foldchange = (($sum_tumor/$number_tumor) / ($sum_normal/$number_normal));
        my @array = ();
        for my $i (1 .. 89) {
            push @array, $F[$i];
        }
        my $line = join("\t", @array);
        print OUT2 "$F[0]\t$foldchange\t$line\n";
    }
}
close IN2; close OUT2;

open (IN3, "$dir/01_DEPs_call_pvalue_MSI.txt") or die;
open (OUT3, "> $dir/02_DEPs_call_foldchange_MSI.txt") or die;
while (<IN3>) {
    chomp;
    if ($_ =~ /^P_value/) {
        print OUT3 "GeneSymbol\tFoldChange\t$_\n";
    }
    else {
        my @F = split(/\t/, $_);
        my ($number_normal, $number_tumor, $sum_normal, $sum_tumor) = (0, 0, 0, 0);
        for my $i (2 .. 31) {
            next if ($F[$i] == 1);
            $number_normal++; $sum_normal += $F[$i];
        }
        for my $i (32 .. 61) {
            next if ($F[$i] == 1);
            $number_tumor++; $sum_tumor += $F[$i];
        }
        my $foldchange = (($sum_tumor/$number_tumor) / ($sum_normal/$number_normal));
        my @array = ();
        for my $i (1 .. 61) {
            push @array, $F[$i];
        }
        my $line = join("\t", @array);
        print OUT3 "$F[0]\t$foldchange\t$line\n";
    }
}
close IN3; close OUT3;
