#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/02_cuffdiff";
my @sample = qw/1T 2T 3T 4T 5T 6T/;

my %gene = (); my %tr = ();
for(my$i=0;$i<@sample;$i++) {
    print "$sample[$i] is processing...\n";
    open (IN1, "$indir/$sample[$i]/genes.fpkm_tracking") or die;
    while (<IN1>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        push @{$gene{$F[0]}}, $F[9];
        push @{$gene{$F[0]}}, $F[13];
    }
    close IN1;

    open (IN2, "$indir/$sample[$i]/isoforms.fpkm_tracking") or die;
    while (<IN2>) {
        chomp;
        next if ($_ =~ /^tracking_id/);
        my @F = split(/\t/, $_);
        push @{$tr{$F[0]}}, $F[9];
        push @{$tr{$F[0]}}, $F[13];
    }
    close IN2;
}

open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/03_expression_summary_gene_novel_known.txt") or die;
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/03_expression_summary_gene_known.txt") or die;
print OUT1 "##FPKM\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\t6N\t6T\n";
print OUT2 "##FPKM\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\t6N\t6T\n";
for my $x (sort keys %gene) {
    my $line = join("\t", @{$gene{$x}});
    print OUT1 "$x\t$line\n";
    print OUT2 "$x\t$line\n" unless ($x =~ /^XLOC/);
}
close OUT1; close OUT2;

open (OUT3, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/03_expression_summary_transcript_novel_known.txt") or die;
open (OUT4, "> /leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/03_expression_summary_transcript_known.txt") or die;
print OUT3 "##FPKM\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\t6N\t6T\n";
print OUT4 "##FPKM\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\t6N\t6T\n";
for my $y (sort keys %tr) {
    my $line = join("\t", @{$tr{$y}});
    print OUT3 "$y\t$line\n";
    print OUT4 "$y\t$line\n" unless ($y =~ /^TCONS/);
}
close OUT3; close OUT4;
