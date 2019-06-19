#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/04_expression_summary";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/05_expression_correlation";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;

for(my$i=0;$i<@sample;$i++) {
    open (IN1, "$indir/$sample[$i].expression_summary.genes") or die;
    open (OUT1, "> $outdir/$sample[$i].total.genes") or die;
    print OUT1 "Gene\tBowtie2_RSEM_FPKM\tTophat2_Cufflinks_FPKM\tSalmon_Tximport_FPKM\n";
    open (OUT2, "> $outdir/$sample[$i].br_overlap_tc.genes") or die;
    print OUT2 "Gene\tBowtie2_RSEM_FPKM\tTophat2_Cufflinks_FPKM\n";
    open (OUT3, "> $outdir/$sample[$i].br_overlap_st.genes") or die;
    print OUT3 "Gene\tBowtie2_RSEM_FPKM\tSalmon_Tximport_FPKM\n";
    open (OUT4, "> $outdir/$sample[$i].tc_overlap_st.genes") or die;
    print OUT4 "Gene\tTophat2_Cufflinks_FPKM\tSalmon_Tximport_FPKM\n";
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^Gene_ID/);
        my @F = split(/\t/, $_);
        print OUT1 "$F[0]\t$F[16]\t$F[17]\t$F[18]\n";
        print OUT2 "$F[0]\t$F[16]\t$F[17]\n" if (($F[16] > 0) and ($F[17] > 0));
        print OUT3 "$F[0]\t$F[16]\t$F[18]\n" if (($F[16] > 0) and ($F[18] > 0));
        print OUT4 "$F[0]\t$F[17]\t$F[18]\n" if (($F[17] > 0) and ($F[18] > 0));
    }
    close IN1;
    close OUT1; close OUT2; close OUT3; close OUT4;

    open (IN2, "$indir/$sample[$i].expression_summary.transcripts") or die;
    open (OUT5, "> $outdir/$sample[$i].total.transcripts") or die;
    print OUT5 "Gene\tBowtie2_RSEM_FPKM\tTophat2_Cufflinks_FPKM\tSalmon_Tximport_FPKM\n";
    open (OUT6, "> $outdir/$sample[$i].br_overlap_tc.transcripts") or die;
    print OUT6 "Gene\tBowtie2_RSEM_FPKM\tTophat2_Cufflinks_FPKM\n";
    open (OUT7, "> $outdir/$sample[$i].br_overlap_st.transcripts") or die;
    print OUT7 "Gene\tBowtie2_RSEM_FPKM\tSalmon_Tximport_FPKM\n";
    open (OUT8, "> $outdir/$sample[$i].tc_overlap_st.transcripts") or die;
    print OUT8 "Gene\tTophat2_Cufflinks_FPKM\tSalmon_Tximport_FPKM\n";
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^Transcript_ID/);
        my @F = split(/\t/, $_);
        print OUT5 "$F[0]\t$F[16]\t$F[17]\t$F[18]\n";
        print OUT6 "$F[0]\t$F[16]\t$F[17]\n" if (($F[16] > 0) and ($F[17] > 0));
        print OUT7 "$F[0]\t$F[16]\t$F[18]\n" if (($F[16] > 0) and ($F[18] > 0));
        print OUT8 "$F[0]\t$F[17]\t$F[18]\n" if (($F[17] > 0) and ($F[18] > 0));
    }
    close IN2;
    close OUT5; close OUT6; close OUT7; close OUT8;
}
