#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/panqf/rna/04_map2geno_tophat/12_cuffdiff/02_cuffdiff";
my $outdir = "/leofs/wulin_group/panqf/rna/04_map2geno_tophat/12_cuffdiff/03_cuffdiff_filter";
my @sample = qw/1T 2T 3T 4T 5T 6T five six/;

for(my$i=0;$i<@sample;$i++) {
    open (IN1, "$indir/$sample[$i]/genes.count_tracking") or die;
    my %count_n = (); my %count_t = ();
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        $count_n{$F[0]} = $F[1]; $count_t{$F[0]} = $F[6];
    }
    close IN1;

    open (IN2, "$indir/$sample[$i]/genes.fpkm_tracking") or die;
    my %fpkm_n = (); my %fpkm_t = ();
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        $fpkm_n{$F[0]} = $F[9]; $fpkm_t{$F[0]} = $F[13];
    }
    close IN2;

    open (IN, "$indir/$sample[$i]/gene_exp.diff") or die;
    open (OUT, "> $outdir/$sample[$i].degs.cuffdiff.txt") or die;
    print OUT "#Gene\tNormal_count\tTumor_count\tNormal_fpkm\tTumor_fpkm\tlog2FC(T/N)\tTest_stat\tP_value\tQ_value\tSignature\n";
    while (<IN>) {
        chomp;
        next if ($_ =~ /^test_id/);
        my @F = split(/\t/, $_);
        if ((($F[9]>=1) or ($F[9]<=-1)) and ($F[12]<=0.05)) {
            if ($F[9]>=2) {
                print OUT "$F[0]\t$count_n{$F[0]}\t$fpkm_n{$F[0]}\t$count_t{$F[0]}\t$fpkm_t{$F[0]}\t$F[9]\t$F[10]\t$F[11]\t$F[12]\tUp\n";
            }
            else {
                print OUT "$F[0]\t$count_n{$F[0]}\t$fpkm_n{$F[0]}\t$count_t{$F[0]}\t$fpkm_t{$F[0]}\t$F[9]\t$F[10]\t$F[11]\t$F[12]\tDown\n";
            }
        }
    }
    close IN;
    close OUT;
}

