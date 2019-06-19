#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/03_Abundance_matrix_mouse_human_normalized_UR.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/05_foldchange_compare/02_foldchange_human_mouse_UR.txt") or die;
while (<IN>) {
    chomp;
    my @F = split(/\t/, $_);
    if ($_ =~ /^GeneSymbol/) {
        my $title = "Gene";
        for my $i (31 .. 120) {
            $title .= "\t$F[$i]";
        }
        print OUT "$title\tMouse_1\tMouse_2\tMouse_3\tMouse_4\tMouse_5\n";
    }
    else {
        my $sum = 0; my $num = 0;
        for my $i (1 .. 30) {
            next unless ($F[$i] > 0);
            $sum += $F[$i];
            $num++;
        }
        my $normal = ($sum / $num);

        my $line = $F[0];
        for my $i (31 .. 120) {
            if ($F[$i] > 0) {
                my $fc = ($F[$i] / $normal);
                $line .= "\t$fc";
            }
            else {
                $line .= "\tNA";
            }
        }

        for my $i (121 .. 125) {
            my $k = ($i + 5);
            if (($F[$i] > 0) and ($F[$k] > 0)) {
                my $fc = ($F[$k] / $F[$i]);
                $line .= "\t$fc";
            }
            else {
                $line .= "\tNA";
            }
        }
        print OUT "$line\n";
    }
}
close IN; close OUT;

