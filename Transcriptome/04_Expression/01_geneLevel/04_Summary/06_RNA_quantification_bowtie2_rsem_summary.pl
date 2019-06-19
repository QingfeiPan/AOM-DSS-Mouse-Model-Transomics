#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/01_map2gene_bowtie2/01_rsem_expression";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;

my %gene = (); my %transcript = ();
for(my$i=0;$i<@sample;$i++) {
    open (IN1, "$dir/$sample[$i].genes.results") or die;
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$gene{$F[0]}}, $F[6];
    }
    close IN1;

    open (IN2, "$dir/$sample[$i].isoforms.results") or die;
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        push @{$transcript{$F[0]}}, $F[6];
    }
    close IN2;
}

open (OUT1, "> 06_RNA_quantification_bowtie2_rsem_summary_Gene.txt") or die;
open (OUT2, "> 06_RNA_quantification_bowtie2_rsem_summary_Transcript.txt") or die;
my $header = join("\t", @sample);
print OUT1 "Gene\t$header\n";
print OUT2 "Transcript\t$header\n";
for my $x (sort keys %gene) {
    my $line = join("\t", @{$gene{$x}});
    print OUT1 "$x\t$line\n";
}
for my $y (sort keys %transcript) {
    my $line = join("\t", @{$transcript{$y}});
    print OUT2 "$y\t$line\n";
}
close OUT1; close OUT2;
