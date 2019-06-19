#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/02_map2geno_tophat2/02_cuffdiff/02_cuffdiff";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/02_tophat2_cufflinks";

for my $x (1 .. 6) {
    my $normal_id = "$x"."N";
    my $tumor_id = "$x"."T";

    my %tpm_gene = ();
    open (REF1, "$outdir/$normal_id.genes.tpm") or die;
    while (<REF1>) {
        chomp;
        my @F = split(/\t/, $_);
        $tpm_gene{$normal_id}{$F[0]} = $F[1];
    }
    close REF1;
    open (REF2, "$outdir/$tumor_id.genes.tpm") or die;
    while (<REF2>) {
        chomp;
        my @F = split(/\t/, $_);
        $tpm_gene{$tumor_id}{$F[0]} = $F[1];
    }
    close REF2;
    open (REF3, "$indir/$tumor_id/genes.read_group_tracking") or die;
    my %raw_frags_gene = (); my %scaled_frags_gene = (); my %effective_length_gene = ();
    while (<REF3>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        $raw_frags_gene{$F[1]}{$F[0]} = $F[3];
        $scaled_frags_gene{$F[1]}{$F[0]} = $F[4];
        $effective_length_gene{$F[1]}{$F[0]} = $F[7];
    }
    close REF3;
    open (IN1, "$indir/$tumor_id/genes.fpkm_tracking") or die;
    open (OUT1, "> $outdir/$normal_id.tophat2_cufflinks.genes") or die;
    print OUT1 "##Gene_ID\tLength\tEffective_Length\tRaw_frags\tScaled_frags\tTPM\tFPKM\n";
    open (OUT2, "> $outdir/$tumor_id.tophat2_cufflinks.genes") or die;
    print OUT2 "##Gene_ID\tLength\tEffective_Length\tRaw_frags\tScaled_frags\tTPM\tFPKM\n";
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        print OUT1 "$F[0]\t$F[7]\t$effective_length_gene{$normal_id}{$F[0]}\t$raw_frags_gene{$normal_id}{$F[0]}\t$scaled_frags_gene{$normal_id}{$F[0]}\t$tpm_gene{$normal_id}{$F[0]}\t$F[9]\n";
        print OUT2 "$F[0]\t$F[7]\t$effective_length_gene{$tumor_id}{$F[0]}\t$raw_frags_gene{$tumor_id}{$F[0]}\t$scaled_frags_gene{$tumor_id}{$F[0]}\t$tpm_gene{$tumor_id}{$F[0]}\t$F[13]\n";
    }
    close IN1; close OUT1; close OUT2;

    my %tpm_transcript = ();
    open (REF4, "$outdir/$normal_id.transcripts.tpm") or die;
    while (<REF4>) {
        chomp;
        my @F = split(/\t/, $_);
        $tpm_transcript{$normal_id}{$F[0]} = $F[1];
    }
    close REF4;
    open (REF5, "$outdir/$tumor_id.transcripts.tpm") or die;
    while (<REF5>) {
        chomp;
        my @F = split(/\t/, $_);
        $tpm_transcript{$tumor_id}{$F[0]} = $F[1];
    }
    close REF5;
    open (REF6, "$indir/$tumor_id/isoforms.read_group_tracking") or die;
    my %raw_frags_transcript = (); my %scaled_frags_transcript = (); my %effective_length_transcript = ();
    while (<REF6>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        $raw_frags_transcript{$F[1]}{$F[0]} = $F[3];
        $scaled_frags_transcript{$F[1]}{$F[0]} = $F[4];
        $effective_length_transcript{$F[1]}{$F[0]} = $F[7];
    }
    close REF6;
    open (IN2, "$indir/$tumor_id/isoforms.fpkm_tracking") or die;
    open (OUT3, "> $outdir/$normal_id.tophat2_cufflinks.transcripts") or die;
    print OUT3 "##Transcript_ID\tLength\tEffective_Length\tRaw_frags\tScaled_frags\tTPM\tFPKM\n";
    open (OUT4, "> $outdir/$tumor_id.tophat2_cufflinks.transcripts") or die;
    print OUT4 "##Transcript_ID\tLength\tEffective_Length\tRaw_frags\tScaled_frags\tTPM\tFPKM\n";
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        print OUT3 "$F[0]\t$F[7]\t$effective_length_transcript{$normal_id}{$F[0]}\t$raw_frags_transcript{$normal_id}{$F[0]}\t$scaled_frags_transcript{$normal_id}{$F[0]}\t$tpm_transcript{$normal_id}{$F[0]}\t$F[9]\n";
        print OUT4 "$F[0]\t$F[7]\t$effective_length_transcript{$tumor_id}{$F[0]}\t$raw_frags_transcript{$tumor_id}{$F[0]}\t$scaled_frags_transcript{$tumor_id}{$F[0]}\t$tpm_transcript{$tumor_id}{$F[0]}\t$F[13]\n";
    }
    close IN2; close OUT3; close OUT4;
}
