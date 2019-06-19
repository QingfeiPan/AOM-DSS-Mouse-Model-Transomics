#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/panqf/protein/02_tmt/01_PSMs/02_PSM_filtered";
my $outdir = "/leofs/wulin_group/panqf/protein/02_tmt/02_peptides/01_PSM2peptide";
my $header = "Source\tSequence\tSequence_modification\tAccession\tQuan_usage\tAbundance_1N\tAbundance_1T\tAbundance_2N\tAbundance_2T\tAbundance_3N\tAbundance_3T\tAbundance_4N\tAbundance_4T\tAbundance_5N\tAbundance_5T";

open (IN1, "$indir/Deglyco_PSMs_filtered.txt") or die;
open (OUT1, "> $outdir/Deglyco_PSM2peptide.txt") or die;
print OUT1 "$header\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /Checked/);
    next if ($_ =~ /ExcludedByMethod/);
    my @F = split(/\t/, $_);
    for my $x (40 .. 49) {$F[$x] = 0 unless (defined $F[$x]);}
    $F[4] =~ /\]\.(\w+)\.\[/; my $seqraw1 = $1; $seqraw1 = uc($seqraw1);
    my @G = split(/;/, $F[36]);
    if ($F[36] =~ /\w/) {
        my @num1 = (); my @num2 = ();
        for my $x (@G) {
            if ($x =~ /N(\d+)\(Deami/) {
                push @num1, $1;
            }
            elsif ($x =~ /[S|T|Y](\d+)\(Phospho/) {
                push @num2, $1;
            }
            else {
                next;
            }
        }
        my @sequence = split(//, $seqraw1);
        for my $x (@num1) {
            my $i = $x - 1;
            $sequence[$i] = "d"."$sequence[$i]";
        }
        for my $y (@num2) {
            my $k = $y - 1;
            $sequence[$k] = "p"."$sequence[$k]";
        }
        my $seqnew = join("", @sequence);
        print OUT1 "Deglyco\t$seqraw1\t$seqnew\t$F[8]\t$F[38]\t$F[40]\t$F[41]\t$F[42]\t$F[43]\t$F[44]\t$F[45]\t$F[46]\t$F[47]\t$F[48]\t$F[49]\n";
    }
    else {
        print OUT1 "Deglyco\t$seqraw1\t$seqraw1\t$F[8]\t$F[38]\t$F[40]\t$F[41]\t$F[42]\t$F[43]\t$F[44]\t$F[45]\t$F[46]\t$F[47]\t$F[48]\t$F[49]\n";
    }
}
close IN1; close OUT1;

open (IN2, "$indir/Phospho_PSMs_filtered.txt") or die;
open (OUT2, "> $outdir/Phospho_PSM2peptide.txt") or die;
print OUT2 "$header\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /Checked/);
    next if ($_ =~ /ExcludedByMethod/);
    my @F = split(/\t/, $_);
    for my $x (40 .. 49) {$F[$x] = 0 unless (defined $F[$x]);}
    $F[4] =~ /\]\.(\w+)\.\[/; my $seqraw2 = $1; $seqraw2 = uc($seqraw2);
    my @G = split(/;/, $F[36]);
    if ($F[36] =~ /\w/) {
        my @num = ();
        for my $x (@G) {
            $x =~ /[S|T|Y](\d+)\(Phospho/;
            push @num, $1;
        }
        my @sequence = split(//, $seqraw2);
        for my $x (@num) {
            my $i = $x - 1;
            $sequence[$i] = "p"."$sequence[$i]";
        }
        my $seqnew = join("", @sequence);
        print OUT2 "Phospho\t$seqraw2\t$seqnew\t$F[8]\t$F[38]\t$F[40]\t$F[41]\t$F[42]\t$F[43]\t$F[44]\t$F[45]\t$F[46]\t$F[47]\t$F[48]\t$F[49]\n";
    }
    else {
        print OUT2 "Phospho\t$seqraw2\t$seqraw2\t$F[8]\t$F[38]\t$F[40]\t$F[41]\t$F[42]\t$F[43]\t$F[44]\t$F[45]\t$F[46]\t$F[47]\t$F[48]\t$F[49]\n";
    }
}
close IN2; close OUT2;

open (IN3, "$indir/NMP_PSMs_filtered.txt") or die;
open (OUT3, "> $outdir/NMP_PSM2peptide.txt") or die;
print OUT3 "$header\n";
while (<IN3>) {
    chomp;
    next if ($_ =~ /Checked/);
    next if ($_ =~ /ExcludedByMethod/);
    my @F = split(/\t/, $_);
    for my $x (40 .. 49) {$F[$x] = 0 unless (defined $F[$x]);}
    $F[4] =~ /\]\.(\w+)\.\[/; my $seqraw3 = $1; $seqraw3 = uc($seqraw3);
    print OUT3 "NMP\t$seqraw3\t$seqraw3\t$F[8]\t$F[37]\t$F[39]\t$F[40]\t$F[41]\t$F[42]\t$F[43]\t$F[44]\t$F[45]\t$F[46]\t$F[47]\t$F[48]\n";
}
close IN3;close OUT3;

