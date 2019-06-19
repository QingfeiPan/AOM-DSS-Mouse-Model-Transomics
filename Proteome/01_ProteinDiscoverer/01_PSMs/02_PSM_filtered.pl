#!/usr/bin/perl

use strict;
use warnings;
##Description: Select qualified PSMs for peptide quantification.

my $indir = "/leofs/wulin_group/panqf/protein/02_tmt/01_PSMs/01_PSM_raw";
my $outdir = "/leofs/wulin_group/panqf/protein/02_tmt/01_PSMs/02_PSM_filtered";
opendir (DIR, $indir) or die;
while (my$file=readdir(DIR)) {
    next unless ($file =~ /QF_(\w+)_PSMs.txt/);
    my $prefix = $1;

    open (IN, "$indir/$file") or die;
    open (OUT, "> $outdir/$prefix\_PSMs_filtered.txt") or die;
    while (<IN>) {
        chomp;
        my @F = split(/\t/, $_);
        if ($_ =~ /^Checked/) {
            print OUT "$_\n";
        }
        else {
            next if ($F[1] ne "High"); ##Confidence
            next if ($F[6] > 1); ##Unique peptides by protein group
            next unless ($F[8] =~ /\w/); ##Remove peptides without protein group accession
            next if ($F[13] > 0.05); ##DeltaCn <= 0.05
            next if ($F[14] > 1); ##Rank = 1
            next if ($F[15] > 1); ##Search Engine rank = 1
            if ($F[34] =~ /\d/) {
                next if ($F[34] > 0.01); ##Percolator q-Value(FDR) <= 0.01
            }
            if ($F[2] =~ /^Mascot/) {
                next if ($F[29] < 22); ##Mascot Ion Score >= 22
            }
            if ($F[2] =~ /^Sequest/) { ##XCorr score greater than 1.5, 2, 2.25 and 2.5 for charge states of +1, +2, +3, and +4, respectively.
                if ($F[11] == 1) {next if ($F[33] < 1.5);}
                if ($F[11] == 2) {next if ($F[33] < 2);}
                if ($F[11] == 3) {next if ($F[33] < 2.25);}
                if ($F[11] == 4) {next if ($F[33] < 2.5);}
            }
            print OUT "$_\n";
        }
    }
    close IN;
    close OUT;
}
closedir DIR;
