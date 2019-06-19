#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein";
open (IN1, "$dir/11_abundance_matrix_mrna.txt") or die;
open (OUT1, "> $dir/12_abundance_foldchange_mrna.txt") or die;
print OUT1 "Gene\tFPKM_1N\tFPKM_2N\tFPKM_3N\tFPKM_4N\tFPKM_5N\tFPKM_Mean_Normal\tFPKM_1T\tFPKM_2T\tFPKM_3T\tFPKM_4T\tFPKM_5T\tFPKM_Mean_Tumor\tFoldChange1\tFoldChange2\tFoldChange3\tFoldChange4\tFoldChange5\tFoldChange_Mean\n";
while (<IN1>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);

    my $sum_normal = ($F[1] + $F[2] + $F[3] + $F[4] + $F[5]);
    my $sum_tumor = ($F[6] + $F[7] + $F[8] + $F[9] + $F[10]);
    my ($normal_count, $tumor_count) = (0,0);
    for(my$x=1;$x<=5;$x++) {
        my $y = $x + 5;
        $normal_count++ unless ($F[$x] == 0);
        $tumor_count++ unless ($F[$y] == 0);
    }
    my ($normal_mean, $tumor_mean);
    if ($normal_count == 0) {$normal_mean = 0;} else {$normal_mean = ($sum_normal / $normal_count);}
    if ($tumor_count == 0) {$tumor_mean = 0;} else {$tumor_mean = ($sum_tumor / $tumor_count);}

    my ($foldchange1, $foldchange2, $foldchange3, $foldchange4, $foldchange5, $foldchange_mean);
    if (($F[1] > 0 ) and ($F[6] > 0 )) {$foldchange1 = ($F[6] / $F[1]);} else {$foldchange1 = "NA";}
    if (($F[2] > 0 ) and ($F[7] > 0 )) {$foldchange2 = ($F[7] / $F[2]);} else {$foldchange2 = "NA";}
    if (($F[3] > 0 ) and ($F[8] > 0 )) {$foldchange3 = ($F[8] / $F[3]);} else {$foldchange3 = "NA";}
    if (($F[4] > 0 ) and ($F[9] > 0 )) {$foldchange4 = ($F[9] / $F[4]);} else {$foldchange4 = "NA";}
    if (($F[5] > 0 ) and ($F[10] > 0 )) {$foldchange5 = ($F[10] / $F[5]);} else {$foldchange5 = "NA";}
    if (($normal_mean > 0 ) and ($tumor_mean > 0 )) {$foldchange_mean = ($tumor_mean / $normal_mean);} else {$foldchange_mean = "NA";}
    print OUT1 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$normal_mean\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$tumor_mean\t$foldchange1\t$foldchange2\t$foldchange3\t$foldchange4\t$foldchange5\t$foldchange_mean\n";
}
close IN1; close OUT1;

open (IN2, "$dir/11_abundance_matrix_protein_UR.txt") or die;
open (OUT2, "> $dir/12_abundance_foldchange_protein_UR.txt") or die;
print OUT2 "Gene\tLFQ_1N\tLFQ_2N\tLFQ_3N\tLFQ_4N\tLFQ_5N\tLFQ_Mean_Normal\tLFQ_1T\tLFQ_2T\tLFQ_3T\tLFQ_4T\tLFQ_5T\tLFQ_Mean_Tumor\tFoldChange1\tFoldChange2\tFoldChange3\tFoldChange4\tFoldChange5\tFoldChange_Mean\n";
while (<IN2>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);

    my $sum_normal = ($F[1] + $F[2] + $F[3] + $F[4] + $F[5]);
    my $sum_tumor = ($F[6] + $F[7] + $F[8] + $F[9] + $F[10]);
    my ($normal_count, $tumor_count) = (0,0);
    for(my$x=1;$x<=5;$x++) {
        my $y = $x + 5;
        $normal_count++ unless ($F[$x] == 0);
        $tumor_count++ unless ($F[$y] == 0);
    }
    my ($normal_mean, $tumor_mean);
    if ($normal_count == 0) {$normal_mean = 0;} else {$normal_mean = ($sum_normal / $normal_count);}
    if ($tumor_count == 0) {$tumor_mean = 0;} else {$tumor_mean = ($sum_tumor / $tumor_count);}

    my ($foldchange1, $foldchange2, $foldchange3, $foldchange4, $foldchange5, $foldchange_mean);
    if (($F[1] > 0 ) and ($F[6] > 0 )) {$foldchange1 = ($F[6] / $F[1]);} else {$foldchange1 = "NA";}
    if (($F[2] > 0 ) and ($F[7] > 0 )) {$foldchange2 = ($F[7] / $F[2]);} else {$foldchange2 = "NA";}
    if (($F[3] > 0 ) and ($F[8] > 0 )) {$foldchange3 = ($F[8] / $F[3]);} else {$foldchange3 = "NA";}
    if (($F[4] > 0 ) and ($F[9] > 0 )) {$foldchange4 = ($F[9] / $F[4]);} else {$foldchange4 = "NA";}
    if (($F[5] > 0 ) and ($F[10] > 0 )) {$foldchange5 = ($F[10] / $F[5]);} else {$foldchange5 = "NA";}
    if (($normal_mean > 0 ) and ($tumor_mean > 0 )) {$foldchange_mean = ($tumor_mean / $normal_mean);} else {$foldchange_mean = "NA";}
    print OUT2 "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$normal_mean\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$tumor_mean\t$foldchange1\t$foldchange2\t$foldchange3\t$foldchange4\t$foldchange5\t$foldchange_mean\n";
}
close IN2; close OUT2;
