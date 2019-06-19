#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/21_abundance_matrix_DEGs_DEPs_overlap.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/1N.fpkm_lfq.txt") or die; print OUT1 "Gene\tFPKM\tLFQ\n";
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/1T.fpkm_lfq.txt") or die; print OUT2 "Gene\tFPKM\tLFQ\n";
open (OUT3, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/2N.fpkm_lfq.txt") or die; print OUT3 "Gene\tFPKM\tLFQ\n";
open (OUT4, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/2T.fpkm_lfq.txt") or die; print OUT4 "Gene\tFPKM\tLFQ\n";
open (OUT5, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/3N.fpkm_lfq.txt") or die; print OUT5 "Gene\tFPKM\tLFQ\n";
open (OUT6, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/3T.fpkm_lfq.txt") or die; print OUT6 "Gene\tFPKM\tLFQ\n";
open (OUT7, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/4N.fpkm_lfq.txt") or die; print OUT7 "Gene\tFPKM\tLFQ\n";
open (OUT8, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/4T.fpkm_lfq.txt") or die; print OUT8 "Gene\tFPKM\tLFQ\n";
open (OUT9, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/5N.fpkm_lfq.txt") or die; print OUT9 "Gene\tFPKM\tLFQ\n";
open (OUT10, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/5T.fpkm_lfq.txt") or die; print OUT10 "Gene\tFPKM\tLFQ\n";
open (OUT11, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Normal.fpkm_lfq.txt") or die; print OUT11 "Gene\tFPKM\tLFQ\n";
open (OUT12, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Tumor.fpkm_lfq.txt") or die; print OUT12 "Gene\tFPKM\tLFQ\n";
open (OUT13, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Foldchange1.txt") or die; print OUT13 "Gene\tFPKM\tLFQ\n";
open (OUT14, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Foldchange2.txt") or die; print OUT14 "Gene\tFPKM\tLFQ\n";
open (OUT15, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Foldchange3.txt") or die; print OUT15 "Gene\tFPKM\tLFQ\n";
open (OUT16, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Foldchange4.txt") or die; print OUT16 "Gene\tFPKM\tLFQ\n";
open (OUT17, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Foldchange5.txt") or die; print OUT17 "Gene\tFPKM\tLFQ\n";
open (OUT18, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap/Foldchange_mean.txt") or die; print OUT18 "Gene\tFPKM\tLFQ\n";

while (<IN>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    print OUT1 "$F[0]\t$F[1]\t$F[19]\n" if (($F[1] > 0) and ($F[19] > 0));
    print OUT2 "$F[0]\t$F[7]\t$F[25]\n" if (($F[7] > 0) and ($F[25] > 0));
    print OUT3 "$F[0]\t$F[2]\t$F[20]\n" if (($F[2] > 0) and ($F[20] > 0));
    print OUT4 "$F[0]\t$F[8]\t$F[26]\n" if (($F[8] > 0) and ($F[26] > 0));
    print OUT5 "$F[0]\t$F[3]\t$F[21]\n" if (($F[3] > 0) and ($F[21] > 0));
    print OUT6 "$F[0]\t$F[9]\t$F[27]\n" if (($F[9] > 0) and ($F[27] > 0));
    print OUT7 "$F[0]\t$F[4]\t$F[22]\n" if (($F[4] > 0) and ($F[22] > 0));
    print OUT8 "$F[0]\t$F[10]\t$F[28]\n" if (($F[10] > 0) and ($F[28] > 0));
    print OUT9 "$F[0]\t$F[5]\t$F[23]\n" if (($F[5] > 0) and ($F[23] > 0));
    print OUT10 "$F[0]\t$F[11]\t$F[29]\n" if (($F[11] > 0) and ($F[29] > 0));
    print OUT11 "$F[0]\t$F[6]\t$F[24]\n" if (($F[6] > 0) and ($F[24] > 0));
    print OUT12 "$F[0]\t$F[12]\t$F[30]\n" if (($F[12] > 0) and ($F[30] > 0));
    if (($F[1] > 0) and ($F[7] > 0) and ($F[19] > 0) and ($F[25] > 0)) {my $fc_fpkm = ($F[7] / $F[1]); my $fc_lfq = ($F[25] / $F[19]); print OUT13 "$F[0]\t$fc_fpkm\t$fc_lfq\n";}
    if (($F[2] > 0) and ($F[8] > 0) and ($F[20] > 0) and ($F[26] > 0)) {my $fc_fpkm = ($F[8] / $F[2]); my $fc_lfq = ($F[26] / $F[20]); print OUT14 "$F[0]\t$fc_fpkm\t$fc_lfq\n";}
    if (($F[3] > 0) and ($F[9] > 0) and ($F[21] > 0) and ($F[27] > 0)) {my $fc_fpkm = ($F[9] / $F[3]); my $fc_lfq = ($F[27] / $F[21]); print OUT15 "$F[0]\t$fc_fpkm\t$fc_lfq\n";}
    if (($F[4] > 0) and ($F[10] > 0) and ($F[22] > 0) and ($F[28] > 0)) {my $fc_fpkm = ($F[10] / $F[4]); my $fc_lfq = ($F[28] / $F[22]); print OUT16 "$F[0]\t$fc_fpkm\t$fc_lfq\n";}
    if (($F[5] > 0) and ($F[11] > 0) and ($F[23] > 0) and ($F[29] > 0)) {my $fc_fpkm = ($F[11] / $F[5]); my $fc_lfq = ($F[29] / $F[23]); print OUT17 "$F[0]\t$fc_fpkm\t$fc_lfq\n";}
    if (($F[6] > 0) and ($F[12] > 0) and ($F[24] > 0) and ($F[30] > 0)) {my $fc_fpkm = ($F[12] / $F[6]); my $fc_lfq = ($F[30] / $F[24]); print OUT18 "$F[0]\t$fc_fpkm\t$fc_lfq\n";}
}
close IN;
close OUT1; close OUT2; close OUT3; close OUT4; close OUT5; close OUT6; close OUT7; close OUT8; close OUT9; close OUT10; close OUT11; close OUT12; close OUT13; close OUT14; close OUT15; close OUT16;


