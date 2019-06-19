#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/panqf/protein/02_tmt/02_peptides/03_peptide_quant/Phospho_peptide_quant.txt") or die;
open (OUT, "> /leofs/wulin_group/panqf/protein/02_tmt/02_peptides/04_Phospho_peptides_profiling.txt") or die;
print OUT "Peptide\tNumber_Phospho-sites\tNumber-pS\tNumber-sT\tNumber-sY\;";

my ($pS, $pT, $pY) = (0,0,0);
while (<IN>) {
    chomp;
    next if ($_ =~ /Source/);
    my @F = split(/\t/, $_);
    my $count = $F[2] =~ s/p/p/g;
    my $count_pS = $F[2] =~ s/pS/pS/g;
    my $count_pT = $F[2] =~ s/pT/pT/g;
    my $count_pY = $F[2] =~ s/pY/pY/g;
    print OUT "$F[2]\t$count\t$count_pS\t$count_pT\t$count_pY\n";
    $pS += $count_pS; $pT += $count_pT; $pY += $count_pY;
}
close IN; close OUT;
print "pS: $pS\npT: $pT\npY: $pY\n";
