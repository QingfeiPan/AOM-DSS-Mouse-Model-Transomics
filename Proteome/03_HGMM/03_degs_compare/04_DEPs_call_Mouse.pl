#!/usr/bin/perl

use strict;
use warnings;

open (REF1, "/leofs/wulin_group/zhangcm/ref/UniProt_Reviewed_Musmusculus.fasta") or die;
my %gene = ();
while (<REF1>) {
    chomp;
    next unless ($_ =~ /^>sp/);
    my @F = split(/\|/, $_);
    my $gene;
    if ($_ =~ /GN=(.+) PE/) {$gene = $1;} else {next;}
    $gene{$F[1]} = $gene;
}
close REF1;

open (REF2, "/leofs/wulin_group/zhangcm/ref/Gene_homology_mouse_to_human.txt") or die;
my %mmhg = ();
while (<REF2>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($F[1] =~ /,/) {
        $mmhg{$F[0]} = (split(/,/,$F[1]))[0];
    }
    else {
        $mmhg{$F[0]} = $F[1];
    }
}
close REF2;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_LFQ.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/04_DEPs_call_Mouse_unique.txt") or die;
print OUT1 "GeneSymbol\tP_value\tFoldChange\tRegulation\tProtein_ID\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {
        if (exists $mmhg{$gene{$F[0]}}) {
            print OUT1 "$mmhg{$gene{$F[0]}}\t$F[12]\t$F[11]\t$F[13]\t$F[0]\n";
        }
        else {
            print OUT1 "-\t$F[12]\t$F[11]\t$F[13]\t$F[0]\n";
        }
    }
    else {
        print OUT1 "-\t$F[12]\t$F[11]\t$F[13]\t$F[0]\n";
    }
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_razor_LFQ.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/04_DEPs_call_Mouse_unique_razor.txt") or die;
print OUT2 "GeneSymbol\tP_value\tFoldChange\tRegulation\tProtein_ID\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {
        if (exists $mmhg{$gene{$F[0]}}) {
            print OUT2 "$mmhg{$gene{$F[0]}}\t$F[12]\t$F[11]\t$F[13]\t$F[0]\n";
        }
        else {
            print OUT2 "-\t$F[12]\t$F[11]\t$F[13]\t$F[0]\n";
        }
    }
    else {
        print OUT2 "-\t$F[12]\t$F[11]\t$F[13]\t$F[0]\n";
    }
}
close IN2; close OUT2;
