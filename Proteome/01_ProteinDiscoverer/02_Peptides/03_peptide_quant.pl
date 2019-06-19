#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/panqf/protein/02_tmt/02_peptides/02_peptide_recat";
my $outdir = "/leofs/wulin_group/panqf/protein/02_tmt/02_peptides/03_peptide_quant";

my @sample = qw/Deglyco Phospho NMP/;
for(my$i=0;$i<@sample;$i++) {
    open (IN, "$indir/$sample[$i]_recategory.txt") or die;
    open (OUT, "> $outdir/$sample[$i]_peptide_quant.txt") or die;
    my %seq = (); my %protein = ();
    my %hash1n = (); my %hash1t = (); my %hash2n = (); my %hash2t = (); my %hash3n = (); my %hash3t = (); my %hash4n = (); my %hash4t = (); my %hash5n = (); my %hash5t = ();
    while (<IN>) {
        chomp;
        my @F = split(/\t/, $_);
        next if ($F[4] eq "DoNotUse");
        if ($_ =~ /^Source/) {
            print OUT "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$F[12]\t$F[13]\t$F[14]\n";
        }
        else {
            $seq{$F[2]} = $F[1];
            $protein{$F[2]} = $F[3];
            for my $k (5 .. 14) {$F[$k] = 0 unless ($F[$k] =~ /\d/);}
            $hash1n{$F[2]} += $F[5]; $hash1t{$F[2]} += $F[6];
            $hash2n{$F[2]} += $F[7]; $hash2t{$F[2]} += $F[8];
            $hash3n{$F[2]} += $F[9]; $hash3t{$F[2]} += $F[10];
            $hash4n{$F[2]} += $F[11]; $hash4t{$F[2]} += $F[12];
            $hash5n{$F[2]} += $F[13]; $hash5t{$F[2]} += $F[14];
        }
    }
    close IN;

    for my $x (sort keys %seq) {
        print OUT "$sample[$i]\t$seq{$x}\t$x\t$protein{$x}\t$hash1n{$x}\t$hash1t{$x}\t$hash2n{$x}\t$hash2t{$x}\t$hash3n{$x}\t$hash3t{$x}\t$hash4n{$x}\t$hash4t{$x}\t$hash5n{$x}\t$hash5t{$x}\n";
    }
    close OUT;
}
