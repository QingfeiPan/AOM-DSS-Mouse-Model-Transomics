#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/00_from_MQ/proteinGroups_unique_razor_TMT.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s3_quant_extract_unique_razor_TMT.txt") or die;
print OUT "Protein_ID\tIntensity_1N\tIntensity_2N\tIntensity_3N\tIntensity_4N\tIntensity_5N\tIntensity_1T\tIntensity_2T\tIntensity_3T\tIntensity_4T\tIntensity_5T\n";
while (<IN>) {
    chomp;
    next if ($_ =~ /Protein IDs/);
    my @F = split(/\t/, $_);
    if ($F[1] =~ /;/) {
        my @G = split(/;/, $F[1]);
        for(my$i=0;$i<@G;$i++) {
            if ($G[$i] =~ /^sp/) {
                my $pro_id = (split(/\|/, $G[$i]))[1];
                my $intensity = ($F[98]+$F[99]+$F[100]+$F[101]+$F[102]+$F[103]+$F[104]+$F[105]+$F[106]+$F[107]);
                print OUT "$pro_id\t$F[98]\t$F[100]\t$F[102]\t$F[104]\t$F[106]\t$F[99]\t$F[101]\t$F[103]\t$F[105]\t$F[107]\n" unless ($intensity == 0);
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
        my $intensity = ($F[98]+$F[99]+$F[100]+$F[101]+$F[102]+$F[103]+$F[104]+$F[105]+$F[106]+$F[107]);
        print OUT "$pro_id\t$F[98]\t$F[100]\t$F[102]\t$F[104]\t$F[106]\t$F[99]\t$F[101]\t$F[103]\t$F[105]\t$F[107]\n" unless ($intensity == 0);
    }
}
close IN; close OUT;

