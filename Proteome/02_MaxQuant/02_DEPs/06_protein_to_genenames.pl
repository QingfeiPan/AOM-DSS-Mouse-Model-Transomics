#!/usr/bin/perl
use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/ref/UniProt_Reviewed_Musmusculus.fasta") or die;
my %gene = ();
while (<REF>) {
    chomp;
    next unless ($_ =~ /^>sp/);
    my @F = split(/\|/, $_);
    my $gene;
    if ($_ =~ /GN=(.+) PE/) {$gene = $1;} else {next;}
    $gene{$F[1]} = $gene;
}
close REF;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_LFQ.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/06_protein_to_genenames_unique_LFQ.txt") or die;
print OUT1 "Protein_ID\tGene_Symbol\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {
        print OUT1 "$F[0]\t$gene{$F[0]}\n";
    }
    else {
        print OUT1 "$F[0]\t-\n";
    }
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_razor_LFQ.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/06_protein_to_genenames_unique_razor_LFQ.txt") or die;
print OUT2 "Protein_ID\tGene_Symbol\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {
        print OUT2 "$F[0]\t$gene{$F[0]}\n";
    }
    else {
        print OUT2 "$F[0]\t-\n";
    }
}
close IN2; close OUT2;

