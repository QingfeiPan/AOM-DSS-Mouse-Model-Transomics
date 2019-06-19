#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/22_correlation_bysample_DEGs_DEPs_overlap";
my @sample = qw/Foldchange1 Foldchange2 Foldchange3 Foldchange4 Foldchange5 Foldchange_mean/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/23_DEGs_DEPs_overlap_gene_regulation_statistics.txt") or die;
print STA "Sample\tGene Total\tGene Up,Up\tGene Down,Down\tGene Up,Down\tGene Down,Up\n"; ##format: Regulation in mRNA,protein

for (my$i=0;$i<@sample;$i++) {
    open (IN, "$dir/$sample[$i].txt") or die;
    my ($total, $area1, $area2, $area3, $area4) = (0,0,0,0,0);
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Gene/);
        my @F = split(/\t/, $_);
        $area1++ if (($F[1] > 1) and ($F[2] > 1));
        $area2++ if (($F[1] < 1) and ($F[2] > 1));
        $area3++ if (($F[1] < 1) and ($F[2] < 1));
        $area4++ if (($F[1] > 1) and ($F[2] < 1));
    }
    close IN;
    $total = ($area1 + $area2 + $area3 + $area4);
    print STA "$sample[$i]\t$total\t$area1\t$area3\t$area4\t$area2\n";
}
close STA;
