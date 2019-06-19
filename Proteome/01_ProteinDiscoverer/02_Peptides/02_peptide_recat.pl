#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/panqf/protein/02_tmt/02_peptides/01_PSM2peptide";
my $outdir = "/leofs/wulin_group/panqf/protein/02_tmt/02_peptides/02_peptide_recat";
my $header = "Source\tSequence\tSequence_modification\tAccession\tQuan_usage\tAbundance_1N\tAbundance_1T\tAbundance_2N\tAbundance_2T\tAbundance_3N\tAbundance_3T\tAbundance_4N\tAbundance_4T\tAbundance_5N\tAbundance_5T";

open (OUT1, "> $outdir/Deglyco_recategory.txt") or die;
print OUT1 "$header\n";
open (OUT2, "> $outdir/Phospho_recategory.txt") or die;
print OUT2 "$header\n";
open (OUT3, "> $outdir/NMP_recategory.txt") or die;
print OUT3 "$header\n";

my @sample = qw/Deglyco Phospho NMP/;
for(my$i=0;$i<@sample;$i++) {
    open (IN, "$indir/$sample[$i]_PSM2peptide.txt") or die;
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Source/);
        my %modified = ();
        my @F = split(/\t/, $_);
        if ($F[2] =~ /dN(\w)[S|T|C]/) {
            if ($1 ne "P") {
                print OUT1 "$_\n";
                $modified{$F[2]}++;
            }
        }
        if ($F[2] =~ /p[S|T|Y]/) {
            print OUT2 "$_\n";
            $modified{$F[2]}++;
        }
        print OUT3 "$_\n" unless (exists $modified{$F[2]});
    }
    close IN;
}
