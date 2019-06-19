#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/00_from_MQ/proteinGroups_unique_labelfree.txt") or die;
open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s2_quant_extract_unique_iBAQ.txt") or die;
print OUT1 "Protein_ID\tiBAQ_1N\tiBAQ_2N\tiBAQ_3N\tiBAQ_4N\tiBAQ_5N\tiBAQ_1T\tiBAQ_2T\tiBAQ_3T\tiBAQ_4T\tiBAQ_5T\n";
open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s2_quant_extract_unique_LFQ.txt") or die;
print OUT2 "Protein_ID\tLFQ_1N\tLFQ_2N\tLFQ_3N\tLFQ_4N\tLFQ_5N\tLFQ_1T\tLFQ_2T\tLFQ_3T\tLFQ_4T\tLFQ_5T\n";
while (<IN>) {
    chomp;
    next if ($_ =~ /Protein IDs/);
    my @F = split(/\t/, $_);
    if ($F[1] =~ /;/) {
        my @G = split(/;/, $F[1]);
        for(my$i=0;$i<@G;$i++) {
            if ($G[$i] =~ /^sp/) {
                my $pro_id = (split(/\|/, $G[$i]))[1];
                my $ibaq = ($F[92]+$F[93]+$F[94]+$F[95]+$F[96]+$F[97]+$F[98]+$F[99]+$F[100]+$F[101]);
                my $lfq = ($F[102]+$F[103]+$F[104]+$F[105]+$F[106]+$F[107]+$F[108]+$F[109]+$F[110]+$F[111]);
                print OUT1 "$pro_id\t$F[92]\t$F[94]\t$F[96]\t$F[98]\t$F[100]\t$F[93]\t$F[95]\t$F[97]\t$F[99]\t$F[101]\n" unless ($ibaq == 0);
                print OUT2 "$pro_id\t$F[102]\t$F[104]\t$F[106]\t$F[108]\t$F[110]\t$F[103]\t$F[105]\t$F[107]\t$F[109]\t$F[111]\n" unless ($lfq == 0);
                last;
            }
            else {
                next;
            }
        }
    }
    else {
        next unless ($F[1] =~ /^sp/);
        my $pro_id = (split(/\|/, $F[1]))[1];
        my $ibaq = ($F[92]+$F[93]+$F[94]+$F[95]+$F[96]+$F[97]+$F[98]+$F[99]+$F[100]+$F[101]);
        my $lfq = ($F[102]+$F[103]+$F[104]+$F[105]+$F[106]+$F[107]+$F[108]+$F[109]+$F[110]+$F[111]);
        print OUT1 "$pro_id\t$F[92]\t$F[94]\t$F[96]\t$F[98]\t$F[100]\t$F[93]\t$F[95]\t$F[97]\t$F[99]\t$F[101]\n" unless ($ibaq == 0);
        print OUT2 "$pro_id\t$F[102]\t$F[104]\t$F[106]\t$F[108]\t$F[110]\t$F[103]\t$F[105]\t$F[107]\t$F[109]\t$F[111]\n" unless ($lfq == 0);
    }
}
close IN; close OUT1; close OUT2;

