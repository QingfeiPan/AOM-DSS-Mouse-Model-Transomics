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

open (REF2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_LFQ.txt") or die;
my %ref_u = (); my $total_u = 0;
while (<REF2>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    next unless (exists $gene{$F[0]});
    if (exists $ref_u{$gene{$F[0]}}) {next;} else {$ref_u{$gene{$F[0]}}++; $total_u++;}
}
close REF2;
print "$total_u DEGs have been saved from 917 DEPs of Unique Only.\n";

open (REF3, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_unique_razor_LFQ.txt") or die;
my %ref_ur = (); my $total_ur = 0;
while (<REF3>) {
    chomp;
    next if ($_ =~ /^Protein_ID/);
    my @F = split(/\t/, $_);
    next unless (exists $gene{$F[0]});
    if (exists $ref_ur{$gene{$F[0]}}) {next;} else {$ref_ur{$gene{$F[0]}}++; $total_ur++;}
}
close REF3;
print "$total_ur DEGs have been saved from 1136 DEPs of Unique+Razor.\n";

open (IN, "/leofs/wulin_group/zhangcm/ref/KEGG2015_mouse_by_pathway.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s1_DEGs_array_for_FET_unique.txt") or die;
print OUT1 "Pathway\tDEGs_in_pathway\tDEGs_NOT_in_pathway\tGenome_in_pathway\tGenome_NOT_in_pathway\tDEGs\tGenome\tIn_pathway\tNOT_in_pathway\tSUM\n";
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s1_DEGs_array_for_FET_unique_razor.txt") or die;
print OUT2 "Pathway\tDEGs_in_pathway\tDEGs_NOT_in_pathway\tGenome_in_pathway\tGenome_NOT_in_pathway\tDEGs\tGenome\tIn_pathway\tNOT_in_pathway\tSUM\n";
while (<IN>) {
    chomp;
    next unless ($_ =~ /^mmu/);
    my @F = split(/\t/,$_);
    my $tag = $F[0];
    my @G = split(/\|/,$F[4]);
    my ($num1_u, $num1_ur) = (0,0);
    foreach my $x (@G) {
        if (exists $ref_u{$x}) {$num1_u++;} else {next;}
        if (exists $ref_ur{$x}) {$num1_ur++;} else {next;}
    }
    my $num2_u = ($total_u - $num1_u); my $num2_ur = ($total_ur - $num1_ur);
    my $num3_u = $F[3]; my $num3_ur = $F[3];
    my $num4_u = (24062 - $num3_u); my $num4_ur = (24062 - $num3_ur);
    my $num5_u = $total_u; my $num5_ur = $total_ur;
    my $num6_u = 24062; my $num6_ur = 24062;
    my $num7_u = ($num1_u + $num3_u); my $num7_ur = ($num1_ur + $num3_ur);
    my $num8_u = ($num2_u + $num4_u); my $num8_ur = ($num2_ur + $num4_ur);
    my $num9_u = ($total_u + 24062); my $num9_ur = ($total_ur + 24062);
    print OUT1 "$tag\t$num1_u\t$num2_u\t$num3_u\t$num4_u\t$num5_u\t$num6_u\t$num7_u\t$num8_u\t$num9_u\n" unless ($num1_u == 0);
    print OUT2 "$tag\t$num1_ur\t$num2_ur\t$num3_ur\t$num4_ur\t$num5_ur\t$num6_ur\t$num7_ur\t$num8_ur\t$num9_ur\n" unless ($num1_ur == 0);
}
close IN; close OUT1; close OUT2;
