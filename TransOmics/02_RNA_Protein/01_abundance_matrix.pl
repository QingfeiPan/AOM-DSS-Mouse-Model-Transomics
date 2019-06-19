#!/usr/bin/perl

use strict;
use warnings;

open (IN1, "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/06_RNA_quantification_bowtie2_rsem_summary_Gene.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/01_abundance_matrix_mrna.txt") or die;
print OUT1 "Gene\tFPKM_1N\tFPKM_2N\tFPKM_3N\tFPKM_4N\tFPKM_5N\tFPKM_1T\tFPKM_2T\tFPKM_3T\tFPKM_4T\tFPKM_5T\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    my $sum = ($F[1] + $F[2] + $F[3] + $F[4] + $F[5] + $F[6] + $F[7] + $F[8] + $F[9] + $F[10]);
    next if ($sum == 0);
    print OUT1 "$F[0]\t$F[1]\t$F[3]\t$F[5]\t$F[7]\t$F[9]\t$F[2]\t$F[4]\t$F[6]\t$F[8]\t$F[10]\n";
}
close IN1; close OUT1;

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

open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s2_quant_extract_unique_LFQ.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/01_abundance_matrix_protein.txt") or die;
print OUT2 "Gene\tLFQ_1N\tLFQ_2N\tLFQ_3N\tLFQ_4N\tLFQ_5N\tLFQ_1T\tLFQ_2T\tLFQ_3T\tLFQ_4T\tLFQ_5T\n";
my %hash = ();
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Protein/);
    my @F = split(/\t/, $_);
    next unless (exists $gene{$F[0]});
    if (exists $hash{$gene{$F[0]}}) {
        my @array = @{$hash{$gene{$F[0]}}};
        for my $x (0 .. 9) {
            my $y = ($x + 1);
            $array[$x] = $array[$x] + $F[$y];
        }
        @{$hash{$gene{$F[0]}}} = @array;
    }
    else {
        for my $z (1 .. 10) {
            push @{$hash{$gene{$F[0]}}}, $F[$z];
        }
    }
}
close IN2;

for my $x (sort keys %hash) {
    my $line = join("\t", @{$hash{$x}});
    print OUT2 "$x\t$line\n";
}
close OUT2;
