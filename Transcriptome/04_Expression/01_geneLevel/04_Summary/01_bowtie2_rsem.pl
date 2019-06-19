#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/01_map2gene_bowtie2/01_rsem_expression";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/01_bowtie2_rsem";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;
for(my$i=0;$i<@sample;$i++) {
    open (REF, "/leofs/wulin_group/zhangcm/panqf/rna/05_DEGs/01_gene/02_edgeR/01_featurecounts/$sample[$i].fc_g.txt") or die;
    my %counts = ();
    while (<REF>) {
        chomp;
        next if ($_ =~ /accepted_hits.bam/);
        my @F = split(/\t/,$_);
        $counts{$F[0]} = $F[1];
    }
    close REF;

    open (IN1, "$indir/$sample[$i].genes.results") or die;
    open (OUT1, "> $outdir/$sample[$i].bowtie2_rsem.genes") or die;
    print OUT1 "##Gene_ID\tLength\tEffective_Length\tCounts(featureCounts)\tExpected_count\tTPM\tFPKM\n";
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^gene_id/);
        my @F = split(/\t/, $_);
        print OUT1 "$F[0]\t$F[2]\t$F[3]\t$counts{$F[0]}\t$F[4]\t$F[5]\t$F[6]\n";
    }
    close IN1;

    open (IN2, "$indir/$sample[$i].isoforms.results") or die;
    open (OUT2, "> $outdir/$sample[$i].bowtie2_rsem.transcripts") or die;
    print OUT2 "##Transcript_ID\tLength\tEffective_Length\tCount\tExpected_Count\tTPM\tFPKM\n";
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^transcript_id/);
        my @F = split(/\t/, $_);
        print OUT2 "$F[0]\t$F[2]\t$F[3]\t-\t$F[4]\t$F[5]\t$F[6]\n";
    }
    close IN2;
}
