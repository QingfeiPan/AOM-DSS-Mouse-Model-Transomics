#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;

my %gene_br = (); my %transcript_br = (); my %gene_tc = (); my %transcript_tc = (); my %gene_st = (); my %transcript_st = ();
for(my$i=0;$i<@sample;$i++) {
    open (IN1, "$dir/01_bowtie2_rsem/$sample[$i].bowtie2_rsem.genes") or die;
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$gene_br{$F[0]}}, $F[6];
    }
    close IN1;

    open (IN2, "$dir/01_bowtie2_rsem/$sample[$i].bowtie2_rsem.transcripts") or die;
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$transcript_br{$F[0]}}, $F[6];
    }
    close IN2;

    open (IN3, "$dir/02_tophat2_cufflinks/$sample[$i].tophat2_cufflinks.genes") or die;
    while (<IN3>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$gene_tc{$F[0]}}, $F[6];
    }
    close IN3;

    open (IN4, "$dir/02_tophat2_cufflinks/$sample[$i].tophat2_cufflinks.transcripts") or die;
    while (<IN4>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$transcript_tc{$F[0]}}, $F[6];
    }
    close IN4;

    open (IN5, "$dir/03_salmon_tximport/$sample[$i].salmon_tximport.genes") or die;
    while (<IN5>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$gene_st{$F[0]}}, $F[6];
    }
    close IN5;

    open (IN6, "$dir/03_salmon_tximport/$sample[$i].salmon_tximport.transcripts") or die;
    while (<IN6>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$transcript_st{$F[0]}}, $F[6];
    }
    close IN6;
}

open (OUT1, "> $dir/07_RNA_quantification_allthree_summary_Gene.txt") or die;
open (OUT2, "> $dir/07_RNA_quantification_allthree_summary_Transcript.txt") or die;
my $header = join("\t", @sample);
print OUT1 "Gene\t$header\t$header\t$header\n";
print OUT2 "Transcript\t$header\t$header\t$header\n";
for my $x (sort keys %gene_br) {
    my ($line_br, $line_tc, $line_st);
    $line_br = join("\t", @{$gene_br{$x}});
    if (exists $gene_tc{$x}) {$line_tc = join("\t", @{$gene_tc{$x}});}else{$line_tc = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0"};
    if (exists $gene_st{$x}) {$line_st = join("\t", @{$gene_st{$x}});}else{$line_st = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0"};
    print OUT1 "$x\t$line_br\t$line_tc\t$line_st\n";
}
for my $x (sort keys %transcript_br) {
    my ($line_br, $line_tc, $line_st);
    $line_br = join("\t", @{$transcript_br{$x}});
    if (exists $transcript_tc{$x}) {$line_tc = join("\t", @{$transcript_tc{$x}});}else{$line_tc = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0"};
    if (exists $transcript_st{$x}) {$line_st = join("\t", @{$transcript_st{$x}});}else{$line_st = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0"};
    print OUT2 "$x\t$line_br\t$line_tc\t$line_st\n";
}
close OUT1; close OUT2;
