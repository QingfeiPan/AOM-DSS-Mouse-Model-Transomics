#!/usr/bin/perl

use strict;
use warnings;

my $indir1 = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/03_salmon/02_s2_summary2gene";
my $indir2 = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/03_salmon/01_quantify_salmon";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/03_salmon_tximport";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;
for(my$i=0;$i<@sample;$i++) {
    open (IN1, "$indir1/$sample[$i].gene.txt") or die;
    my $lib_size = 0;
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^abundance/);
        my @F = split(/\t/, $_);
        $lib_size += $F[2];
    }
    close IN1;
    my $pmsf = ($lib_size / 1000000); ##pmsf equals per million scalling factor

    open (IN1, "$indir1/$sample[$i].gene.txt") or die;
    open (OUT1, "> $outdir/$sample[$i].salmon_tximport.genes") or die;
    print OUT1 "##Gene_ID\tLength\tEffective_Length\tCount\tExpected_Count\tTPM\tFPKM\n";
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^abundance/);
        my @F = split(/\t/, $_);
        my $fpm = ($F[2] / $pmsf);
        my $fpkm = ($fpm / ($F[3] / 1000));
        print OUT1 "$F[0]\t-\t$F[3]\t-\t$F[2]\t$F[1]\t$fpkm\n";
    }
    close IN1;
    close OUT1;

    open (IN2, "$indir2/$sample[$i]/quant.sf") or die;
    my $lib_size_t = 0;
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^Name/);
        my @F = split(/\t/, $_);
        $lib_size += $F[4];
    }
    close IN2;

    open (IN2, "$indir2/$sample[$i]/quant.sf") or die;
    open (OUT2, "> $outdir/$sample[$i].salmon_tximport.transcripts") or die;
    print OUT2 "##Transcript_ID\tLength\tEffective_Length\tCount\tExpected_Count\tTPM\tFPKM\n";
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^Name/);
        my @F = split(/\t/, $_);
        my $fpm_t = ($F[4] / $pmsf);
        my $fpkm_t = ($fpm_t / ($F[2] / 1000));
        print OUT2 "$F[0]\t$F[1]\t$F[2]\t-\t$F[4]\t$F[3]\t$fpkm_t\n";
    }
    close IN2;
    close OUT2;
}
