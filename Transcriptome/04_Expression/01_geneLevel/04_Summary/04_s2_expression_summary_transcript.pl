#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/04_expression_summary";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/04_s2_expression_summary_transcript.txt") or die;
print STA "Sample\tBowtie2_RSEM_Total\tBowtie2_RSEM_Identified\tTophat2_Cufflinks_Total\tTophat2_Cufflinks_Identified\tSalmon_Tximport_Total\tSalmon_Tximport_Identified\tBowtie2-RSEM_overlap_Tophat2-Cufflinks\tBowtie2-RSEM_overlap_Salmon-Tximport\tTophat2-Cufflinks_overlap_Salmon-Tximport\tOverlap_by_three\n";

for(my$i=0;$i<@sample;$i++) {
    my %total_transcript = ();
    open (IN1, "$indir/01_bowtie2_rsem/$sample[$i].bowtie2_rsem.transcripts") or die;
    my %br_length = (); my %br_elength = (); my %br_count = (); my %br_ecount = (); my %br_tpm = (); my %br_fpkm = ();
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^#/);
        my @F = split(/\t/, $_);
        $total_transcript{$F[0]}++;
        $br_length{$F[0]} = $F[1]; $br_elength{$F[0]} = $F[2];
        $br_count{$F[0]} = $F[3]; $br_ecount{$F[0]} = $F[4];
        $br_tpm{$F[0]} = $F[5]; $br_fpkm{$F[0]} = $F[6];
    }
    close IN1;

    open (IN2, "$indir/02_tophat2_cufflinks/$sample[$i].tophat2_cufflinks.transcripts") or die;
    my %tc_length = (); my %tc_elength = (); my %tc_count = (); my %tc_ecount = (); my %tc_tpm = (); my %tc_fpkm = ();
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^#/);
        my @F = split(/\t/, $_);
        $total_transcript{$F[0]}++;
        $tc_length{$F[0]} = $F[1]; $tc_elength{$F[0]} = $F[2];
        $tc_count{$F[0]} = $F[3]; $tc_ecount{$F[0]} = $F[4];
        $tc_tpm{$F[0]} = $F[5]; $tc_fpkm{$F[0]} = $F[6];
    }
    close IN2;

    open (IN3, "$indir/03_salmon_tximport/$sample[$i].salmon_tximport.transcripts") or die;
    my %st_length = (); my %st_elength = (); my %st_count = (); my %st_ecount = (); my %st_tpm = (); my %st_fpkm = ();
    while (<IN3>) {
        chomp;
        next if ($_ =~ /^#/);
        my @F = split(/\t/, $_);
        $total_transcript{$F[0]}++;
        $st_length{$F[0]} = $F[1]; $st_elength{$F[0]} = $F[2];
        $st_count{$F[0]} = $F[3]; $st_ecount{$F[0]} = $F[4];
        $st_tpm{$F[0]} = $F[5]; $st_fpkm{$F[0]} = $F[6];
    }
    close IN3;

    open (OUT, "> $outdir/$sample[$i].expression_summary.transcripts") or die;
    print OUT "Transcript_ID\tLength(Bowtie2_RSEM)\tLength(Tophat2_Cufflinks)\tLength(Salmon_Tximport)\tEffective_Length(Bowtie2_RSEM)\tEffective_Length(Tophat2_Cufflinks)\tEffective_Length(Salmon_Tximport)\tCount(Bowtie2_RSEM)\tCount(Tophat2_Cufflinks)\tCount(Salmon_Tximport)\tExpected_Count(Bowtie2_RSEM)\tExpected_Count(Tophat2_Cufflinks)\tExpected_Count(Salmon_Tximport)\tTPM(Bowtie2_RSEM)\tTPM(Tophat2_Cufflinks)\tTPM(Salmon_Tximport)\tFPKM(Bowtie2_RSEM)\tFPKM(Tophat2_Cufflinks)\tFPKM(Salmon_Tximport)\n";

    my ($br_total, $br_identified, $tc_total, $tc_identified, $st_total, $st_identified, $br_tc, $br_st, $tc_st, $br_tc_st) = (0,0,0,0,0,0,0,0,0);
    for my $x (sort keys %total_transcript) {
        if (exists $br_tpm{$x}) {
            $br_total++;
            $br_identified++ if ($br_tpm{$x} > 0);
        }
        else {
            $br_length{$x} = "-"; $br_elength{$x} = "-"; $br_count{$x} = "-"; $br_ecount{$x} = "-"; $br_tpm{$x} = 0; $br_fpkm{$x} = 0;
        }

        if (exists $tc_tpm{$x}) {
            $tc_total++;
            $tc_identified++ if ($tc_tpm{$x} > 0);
        }
        else {
            $tc_length{$x} = "-"; $tc_elength{$x} = "-"; $tc_count{$x} = "-"; $tc_ecount{$x} = "-"; $tc_tpm{$x} = 0; $tc_fpkm{$x} = 0;
        }

        if (exists $st_tpm{$x}) {
            $st_total++;
            $st_identified++ if ($st_tpm{$x} > 0);
        }
        else {
            $st_length{$x} = "-"; $st_elength{$x} = "-"; $st_count{$x} = "-"; $st_ecount{$x} = "-"; $st_tpm{$x} = 0; $st_fpkm{$x} = 0;
        }

        $br_tc++ if (($br_tpm{$x} > 0) and ($tc_tpm{$x} > 0));
        $br_st++ if (($br_tpm{$x} > 0) and ($st_tpm{$x} > 0));
        $tc_st++ if (($tc_tpm{$x} > 0) and ($st_tpm{$x} > 0));
        $br_tc_st++ if (($br_tpm{$x} > 0) and ($tc_tpm{$x} > 0) and ($st_tpm{$x} > 0));
        print OUT "$x\t$br_length{$x}\t$tc_length{$x}\t$st_length{$x}\t$br_elength{$x}\t$tc_elength{$x}\t$st_elength{$x}\t$br_count{$x}\t$tc_count{$x}\t$st_count{$x}\t$br_ecount{$x}\t$tc_ecount{$x}\t$st_ecount{$x}\t$br_tpm{$x}\t$tc_tpm{$x}\t$st_tpm{$x}\t$br_fpkm{$x}\t$tc_fpkm{$x}\t$st_fpkm{$x}\n";
    }
    close OUT;
    print STA "$sample[$i]\t$br_total\t$br_identified\t$tc_total\t$tc_identified\t$st_total\t$st_identified\t$br_tc\t$br_st\t$tc_st\t$br_tc_st\n";
}
close STA;
