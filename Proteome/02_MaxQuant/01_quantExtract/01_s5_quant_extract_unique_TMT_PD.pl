#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_total.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s5_quant_extract_unique_TMT_PD.txt") or die;
print OUT "Protein_ID\tIntensity_1N\tIntensity_2N\tIntensity_3N\tIntensity_4N\tIntensity_5N\tIntensity_1T\tIntensity_2T\tIntensity_3T\tIntensity_4T\tIntensity_5T\n";
while (<IN>) {
    chomp;
    next if ($_ =~ /^Accession/);
    my @F = split(/\t/, $_);
    print OUT "$F[0]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$F[12]\n";
}
close IN; close OUT;
