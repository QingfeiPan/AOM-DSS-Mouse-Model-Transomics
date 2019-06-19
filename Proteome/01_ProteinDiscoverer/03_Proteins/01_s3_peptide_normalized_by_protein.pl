#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins";
open (REF, "$dir/01_s1_protein_quant_total.txt") or die;
my %pro1n = (); my %pro1t = (); my %pro2n = (); my %pro2t = (); my %pro3n = (); my %pro3t = (); my %pro4n = (); my %pro4t = (); my %pro5n = (); my %pro5t = ();
while (<REF>) {
    chomp;
    my @F = split(/\t/, $_);
    next if ($_ =~ /^Accession/);
    $pro1n{$F[0]} = $F[3]; $pro1t{$F[0]} = $F[8];
    $pro2n{$F[0]} = $F[4]; $pro2t{$F[0]} = $F[9];
    $pro3n{$F[0]} = $F[5]; $pro3t{$F[0]} = $F[10];
    $pro4n{$F[0]} = $F[6]; $pro4t{$F[0]} = $F[11];
    $pro5n{$F[0]} = $F[7]; $pro5t{$F[0]} = $F[12];
}
close REF;

my ($deglyco_t, $deglyco_v) = (0, 0);
open (IN1, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/02_peptides/03_peptide_quant/Deglyco_peptide_quant.txt") or die;
open (OUT1, "> $dir/01_s3_peptide_normalized_by_protein_Deglyco.txt") or die;
print OUT1 "Accession\tProtein_Number\tProtein_List\tAbundance_1N\tAbundance_1T\tAbundance_2N\tAbundance_2T\tAbundance_3N\tAbundance_3T\tAbundance_4N\tAbundance_4T\tAbundance_5N\tAbundance_5T\n";
while (<IN1>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Source/) {
        next;
    }
    else {
        $deglyco_t++;
        if (exists $pro1n{$F[3]}) {
            $F[4] = ($F[4] / $pro2n{$F[3]}); $F[9] = ($F[9] / $pro2t{$F[3]});
            $F[5] = ($F[5] / $pro3n{$F[3]}); $F[10] = ($F[10] / $pro3t{$F[3]});
            $F[6] = ($F[6] / $pro4n{$F[3]}); $F[11] = ($F[11] / $pro4t{$F[3]});
            $F[7] = ($F[7] / $pro5n{$F[3]}); $F[12] = ($F[12] / $pro5t{$F[3]});
            $F[8] = ($F[8] / $pro5n{$F[3]}); $F[13] = ($F[13] / $pro5t{$F[3]});
            my $num = 0;
            if ($F[3] =~ /,/){my @G = split(/,/, $F[3]);$num = @G}else{$num = 1;}
            print OUT1 "$F[2]\t$num\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$F[12]\t$F[13]\n";
            $deglyco_v++;
        }
        else {
            next;
        }
    }
}
close IN1; close OUT1;
print "$deglyco_v out of $deglyco_t Deglyco Peptides are successfully normalized by NMP proteins.\n";

my ($phospho_t, $phospho_v) = (0, 0);
open (IN2, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/02_peptides/03_peptide_quant/Phospho_peptide_quant.txt") or die;
open (OUT2, "> $dir/01_s3_peptide_normalized_by_protein_Phospho.txt") or die;
print OUT2 "Accession\tProtein_Number\tProtein_List\tAbundance_1N\tAbundance_1T\tAbundance_2N\tAbundance_2T\tAbundance_3N\tAbundance_3T\tAbundance_4N\tAbundance_4T\tAbundance_5N\tAbundance_5T\n";
while (<IN2>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^Source/) {
        next;
    }
    else {
        $phospho_t++;
        if (exists $pro1n{$F[3]}) {
            $F[4] = ($F[4] / $pro2n{$F[3]}); $F[9] = ($F[9] / $pro2t{$F[3]});
            $F[5] = ($F[5] / $pro3n{$F[3]}); $F[10] = ($F[10] / $pro3t{$F[3]});
            $F[6] = ($F[6] / $pro4n{$F[3]}); $F[11] = ($F[11] / $pro4t{$F[3]});
            $F[7] = ($F[7] / $pro5n{$F[3]}); $F[12] = ($F[12] / $pro5t{$F[3]});
            $F[8] = ($F[8] / $pro5n{$F[3]}); $F[13] = ($F[12] / $pro5t{$F[3]});
            my $num = 0;
            if ($F[3] =~ /,/){my @G = split(/,/, $F[3]);$num = @G}else{$num = 1;}
            print OUT2 "$F[2]\t$num\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$F[12]\t$F[13]\n";
            $phospho_v++;
        }
        else {
            next;
        }
    }
}
close IN2; close OUT2;
print "$phospho_v out of $phospho_t Phospho Peptides are successfully normalized by NMP proteins.\n"

