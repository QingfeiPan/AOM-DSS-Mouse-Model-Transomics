#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/02_transcript/04_summary";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;

open (STA1, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/02_transcript/04_summary/04_s3_identification_summary_standard_novel_gene.txt") or die;
print STA1 "Sample\tBowtie2_RSEM_Total\tBowtie2_RSEM_Standard\tBowtie2_RSEM_Novel\tTophat2_Cufflinks_Total\tTophat2_Cufflinks_Standard\tTophat2_Cufflinks_Novel\tSalmon_Tximport_Total\tSalmon_Tximport_Standard\tSalmon_Tximport_Novel\n";
open (STA2, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/02_transcript/04_summary/04_s3_identification_summary_standard_novel_transcript.txt") or die;
print STA2 "Sample\tBowtie2_RSEM_Total\tBowtie2_RSEM_Standard\tBowtie2_RSEM_Novel\tTophat2_Cufflinks_Total\tTophat2_Cufflinks_Standard\tTophat2_Cufflinks_Novel\tSalmon_Tximport_Total\tSalmon_Tximport_Standard\tSalmon_Tximport_Novel\n";

for(my$i=0;$i<@sample;$i++) {

    open (IN1, "$indir/01_bowtie2_rsem/$sample[$i].bowtie2_rsem.genes") or die;
    my ($br_g_t, $br_g_s, $br_g_n) = (0, 0, 0);
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        if ($F[2] > 0) {
            $br_g_t++;
            if ($F[0] =~ /^XLOC/) { $br_g_n++; } else { $br_g_s++; }
        }
        else {
            next;
        }
    }
    close IN1;

    open (IN2, "$indir/02_tophat2_cufflinks/$sample[$i].tophat2_cufflinks.genes") or die;
    my ($tc_g_t, $tc_g_s, $tc_g_n) = (0, 0, 0);
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        if ($F[2] > 0) {
            $tc_g_t++;
            if ($F[0] =~ /^XLOC/) { $tc_g_n++; } else { $tc_g_s++; }
        }
        else {
            next;
        }
    }
    close IN2;

    open (IN3, "$indir/03_salmon_tximport/$sample[$i].salmon_tximport.genes") or die;
    my ($st_g_t, $st_g_s, $st_g_n) = (0, 0, 0);
    while (<IN3>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        if ($F[2] > 0) {
            $st_g_t++;
            if ($F[0] =~ /^XLOC/) { $st_g_n++; } else { $st_g_s++; }
        }
        else {
            next;
        }
    }
    close IN3;

    print STA1 "$sample[$i]\t$br_g_t\t$br_g_s\t$br_g_n\t$tc_g_t\t$tc_g_s\t$tc_g_n\t$st_g_t\t$st_g_s\t$st_g_n\n";

    open (IN4, "$indir/01_bowtie2_rsem/$sample[$i].bowtie2_rsem.transcripts") or die;
    my ($br_t_t, $br_t_s, $br_t_n) = (0, 0, 0);
    while (<IN4>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        if ($F[2] > 0) {
            $br_t_t++;
            if ($F[0] =~ /^TCONS/) { $br_t_n++; } else { $br_t_s++; }
        }
        else {
            next;
        }
    }
    close IN4;

    open (IN5, "$indir/02_tophat2_cufflinks/$sample[$i].tophat2_cufflinks.transcripts") or die;
    my ($tc_t_t, $tc_t_s, $tc_t_n) = (0, 0, 0);
    while (<IN5>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        if ($F[2] > 0) {
            $tc_t_t++;
            if ($F[0] =~ /^TCONS/) { $tc_t_n++; } else { $tc_t_s++; }
        }
        else {
            next;
        }
    }
    close IN5;

    open (IN6, "$indir/03_salmon_tximport/$sample[$i].salmon_tximport.transcripts") or die;
    my ($st_t_t, $st_t_s, $st_t_n) = (0, 0, 0);
    while (<IN6>) {
        chomp;
        next if ($_ =~ /^##/);
        my @F = split(/\t/, $_);
        if ($F[2] > 0) {
            $st_t_t++;
            if ($F[0] =~ /^TCON/) { $st_t_n++; } else { $st_t_s++; }
        }
        else {
            next;
        }
    }
    close IN6;

    print STA2 "$sample[$i]\t$br_t_t\t$br_t_s\t$br_t_n\t$tc_t_t\t$tc_t_s\t$tc_t_n\t$st_t_t\t$st_t_s\t$st_t_n\n";
}
close STA1; close STA2;
