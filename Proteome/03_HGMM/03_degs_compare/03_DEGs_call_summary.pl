#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare";
my @sample = qw/Total MSS MSI/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/03_DEGs_call_summary.txt") or die;
print STA "Sample\tDEPs_Total\tDEPs_Up\tDEPs_Down\n";

for(my$i=0;$i<@sample;$i++) {
    open (IN, "$dir/02_DEPs_call_foldchange_$sample[$i].txt") or die;
    open (OUT, "> $dir/02_DEPs_call_summary_$sample[$i].txt") or die;
    print OUT "GeneSymbol\tP_value\tFoldChange\tRegulation\n";
    my ($total, $up, $down) = (0,0,0);
    while (<IN>) {
        chomp;
        next if ($_ =~ /^GeneSymbol/);
        my @F = split(/\t/, $_);
        next unless ($F[2] <= 0.05);
        if ($F[1] >= 2) {
            print OUT "$F[0]\t$F[2]\t$F[1]\tUp\n";
            $up++; $total++;
        }
        elsif ($F[1] <= 0.5) {
            print OUT "$F[0]\t$F[2]\t$F[1]\tDown\n";
            $down++; $total++;
        }
    }
    close IN; close OUT;
    print STA "$sample[$i]\t$total\t$up\t$down\n";
}

