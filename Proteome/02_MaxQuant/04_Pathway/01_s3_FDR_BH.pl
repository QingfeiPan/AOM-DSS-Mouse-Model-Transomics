#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s2_Fisher_Exact_Test_unique_razor.txt") or die;
my @kegg = ();
my %kegg_r = ();
while (<IN>) {
    chomp;
    my @F = split(/\t/,$_);
    next if (($F[4] < 10) or ($F[4] > 500));
    if ($F[0] =~ /^[mmu|hsa]/) {
        push @kegg, $F[1];
        $kegg_r{$F[1]}++;
    }
}
close IN;

my @kegg_sort = sort{$a<=>$b}@kegg;
my $kegg_len = scalar @kegg_sort;
my %kegg_q = ();
for(my$i=0;$i<@kegg_sort;$i++) {
    my $k = ($i + 1);
    $kegg_q{$kegg_sort[$i]} = (($kegg_sort[$i] * $kegg_len) / $k);
}

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s2_Fisher_Exact_Test_unique_razor.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s3_FDR_BH_unique_razor_temp.txt") or die;
print OUT "#Pathway\tP-value\tQ-value\tDamaging_in_pathway\tDamaging_NOT_in_pathway\tGenome_in_pathway\tGenome_NOT_in_pathway\tDamaging\tGenome\tIn_pathway\tNOT_in_pathway\tSUM\n";
while (<IN>) {
    chomp;
    my @F = split(/\t/,$_);
    next if (($F[4] < 10) or ($F[4] > 500));
    if ($F[0] =~ /^[mmu|hsa]/) {
        $kegg_q{$F[1]} = 1 if ($kegg_q{$F[1]} > 1);
        print OUT "$F[0]\t$F[1]\t$kegg_q{$F[1]}\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\n";
    }
}
close IN;
close OUT;
`sort -t "	" -k3g /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s3_FDR_BH_unique_razor_temp.txt > /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s3_FDR_BH_unique_razor.txt`;
`rm /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/04_pathway/01_s3_FDR_BH_unique_razor_temp.txt`;
