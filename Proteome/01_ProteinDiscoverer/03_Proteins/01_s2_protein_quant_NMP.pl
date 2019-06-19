#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/02_peptides/03_peptide_quant/NMP_peptide_quant.txt") or die;
my %unique_peptides = ();
my %hash1n = (); my %hash1t = (); my %hash2n = (); my %hash2t = (); my %hash3n = (); my %hash3t = (); my %hash4n = (); my %hash4t = (); my %hash5n = (); my %hash5t = ();
while (<IN>) {
    chomp;
    next if ($_ =~ /^Source/);
    my @F = split(/\t/, $_);
    push @{$unique_peptides{$F[3]}}, $F[2];
    $hash1n{$F[3]} += $F[4]; $hash1t{$F[3]} += $F[5];
    $hash2n{$F[3]} += $F[6]; $hash2t{$F[3]} += $F[7];
    $hash3n{$F[3]} += $F[8]; $hash3t{$F[3]} += $F[9];
    $hash4n{$F[3]} += $F[10]; $hash4t{$F[3]} += $F[11];
    $hash5n{$F[3]} += $F[12]; $hash5t{$F[3]} += $F[13];
}
close IN;

open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/01_s2_protein_quant_NMP.txt") or die;
print OUT "Accession\tUnique_Peptides_Number\tUnique_Peptides_List\tAbundance_1N\tAbundance_1T\tAbundance_2N\tAbundance_2T\tAbundance_3N\tAbundance_3T\tAbundance_4N\tAbundance_4T\tAbundance_5N\tAbundance_5T\n";
for my $x (sort keys %unique_peptides) {
    my $num = (@{$unique_peptides{$x}} + 1 - 1);
    my $line = join(",", @{$unique_peptides{$x}});
    my $quant1n = ($hash1n{$x} / $num); my $quant1t = ($hash1t{$x} / $num);
    my $quant2n = ($hash2n{$x} / $num); my $quant2t = ($hash2t{$x} / $num);
    my $quant3n = ($hash3n{$x} / $num); my $quant3t = ($hash3t{$x} / $num);
    my $quant4n = ($hash4n{$x} / $num); my $quant4t = ($hash4t{$x} / $num);
    my $quant5n = ($hash5n{$x} / $num); my $quant5t = ($hash5t{$x} / $num);
    print OUT "$x\t$num\t$line\t$quant1n\t$quant1t\t$quant2n\t$quant2t\t$quant3n\t$quant3t\t$quant4n\t$quant4t\t$quant5n\t$quant5t\n";
}
close OUT;
