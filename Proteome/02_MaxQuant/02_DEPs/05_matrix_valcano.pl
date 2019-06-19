#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call";

open (REF1, "$dir/02_quant_pvalue_unique_LFQ.txt") or die;
my %pvalue1 = ();
while (<REF1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    $pvalue1{$F[0]} = $F[11];
}
close REF1;

open (IN1, "$dir/03_quant_foldchange_unique_LFQ.txt") or die;
open (OUT1, "> $dir/05_matrix_valcano_unique_LFQ.txt") or die;
print OUT1 "Protein ID\tFoldChange\tP_value\tRegulation\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    if ($F[11] eq "NA") {
        if ($pvalue1{$F[0]} <= 0.05) {print OUT1 "$F[0]\t$F[11]\t$pvalue1{$F[0]}\t$F[12]\n";}
        else {print OUT1 "$F[0]\t$F[11]\t$pvalue1{$F[0]}\tNo\n";}
    }
    else {
        if (($pvalue1{$F[0]} <= 0.05) and ($F[11] >= 2)) {print OUT1 "$F[0]\t$F[11]\t$pvalue1{$F[0]}\tUp\n";}
        elsif (($pvalue1{$F[0]} <= 0.05) and ($F[11] <= 0.5)) {print OUT1 "$F[0]\t$F[11]\t$pvalue1{$F[0]}\tDown\n";}
        else {print OUT1 "$F[0]\t$F[11]\t$pvalue1{$F[0]}\tNo\n";}
    }
}
close IN1; close OUT1;

open (REF2, "$dir/02_quant_pvalue_unique_razor_LFQ.txt") or die;
my %pvalue2 = ();
while (<REF2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    $pvalue2{$F[0]} = $F[11];
}
close REF2;

open (IN2, "$dir/03_quant_foldchange_unique_razor_LFQ.txt") or die;
open (OUT2, "> $dir/05_matrix_valcano_unique_razor_LFQ.txt") or die;
print OUT2 "Protein ID\tFoldChange\tP_value\tRegulation\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    if ($F[11] eq "NA") {
        if ($pvalue2{$F[0]} <= 0.05) {print OUT2 "$F[0]\t$F[11]\t$pvalue2{$F[0]}\t$F[12]\n";}
        else {print OUT2 "$F[0]\t$F[11]\t$pvalue2{$F[0]}\tNo\n";}
    }
    else {
        if (($pvalue2{$F[0]} <= 0.05) and ($F[11] >= 2)) {print OUT2 "$F[0]\t$F[11]\t$pvalue2{$F[0]}\tUp\n";}
        elsif (($pvalue2{$F[0]} <= 0.05) and ($F[11] <= 0.5)) {print OUT2 "$F[0]\t$F[11]\t$pvalue2{$F[0]}\tDown\n";}
        else {print OUT2 "$F[0]\t$F[11]\t$pvalue2{$F[0]}\tNo\n";}
    }
}
close IN2; close OUT2;
