#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/02_map2geno_tophat2/02_cuffdiff/02_cuffdiff";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/02_tophat2_cufflinks";
for my $x (1 .. 6) {
    my $normal_id = "$x"."N";
    my $tumor_id = "$x"."T";
    open (IN1, "$indir/$tumor_id/genes.fpkm_tracking") or die;
    open (OUT1, "> $outdir/$normal_id.genes.fpkm") or die;
    open (OUT2, "> $outdir/$tumor_id.genes.fpkm") or die;
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        print OUT1 "$F[0]\t$F[9]\n";
        print OUT2 "$F[0]\t$F[13]\n";
    }
    close IN1;
    close OUT1; close OUT2;

    open (IN2, "$indir/$tumor_id/isoforms.fpkm_tracking") or die;
    open (OUT3, "> $outdir/$normal_id.transcripts.fpkm") or die;
    open (OUT4, "> $outdir/$tumor_id.transcripts.fpkm") or die;
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        print OUT3 "$F[0]\t$F[9]\n";
        print OUT4 "$F[0]\t$F[13]\n";
    }
    close IN2;
    close OUT3; close OUT4;
}
