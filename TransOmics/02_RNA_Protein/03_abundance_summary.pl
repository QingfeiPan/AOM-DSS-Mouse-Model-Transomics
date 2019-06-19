#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein";
my %gene = ();
my @header1 = (); my @header2 = ();
open (IN1, "$dir/02_abundance_foldchange_mrna.txt") or die;
my %fpkm = ();
while (<IN1>) {
    chomp;
    if ($_ =~ /^Gene/) {
        @header1 = split(/\t/, $_);
    }
    else {
        my @F = split(/\t/, $_);
        $gene{$F[0]}++;
        $fpkm{$F[0]} = "$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$F[12]\t$F[13]\t$F[14]\t$F[15]\t$F[16]\t$F[17]\t$F[18]";
    }
}
close IN1;

open (IN2, "$dir/02_abundance_foldchange_protein.txt") or die;
my %lfq = ();
while (<IN2>) {
    chomp;
    if ($_ =~ /^Gene/) {
        @header2 = split(/\t/, $_);
    }
    else {
        my @F = split(/\t/, $_);
        $gene{$F[0]}++;
        $lfq{$F[0]} = "$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$F[12]\t$F[13]\t$F[14]\t$F[15]\t$F[16]\t$F[17]\t$F[18]";
    }
}
close IN2;

open (OUT, "> $dir/03_abundance_summary.txt") or die;
my ($line1, $line2);
for(my$i=1;$i<@header1;$i++) {$line1 .= "\t$header1[$i]";}
for(my$i=1;$i<@header2;$i++) {$line2 .= "\t$header2[$i]";}
print OUT "Gene"."$line1"."$line2\n";
for my $x (sort keys %gene) {
    next unless ($gene{$x}>0);
    $fpkm{$x} = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0" unless (exists $fpkm{$x});
    $lfq{$x} = "0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0" unless (exists $lfq{$x});
    print OUT "$x\t$fpkm{$x}\t$lfq{$x}\n";
}
close OUT;
