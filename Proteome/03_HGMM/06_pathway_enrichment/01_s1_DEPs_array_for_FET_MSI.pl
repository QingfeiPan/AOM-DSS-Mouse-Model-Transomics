#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/02_DEPs_call_summary_MSI.txt") or die;
my %ref = (); my $total = 0;
while (<REF>) {
    chomp;
    next if ($_ =~ /^Gene/);
    my @F = split(/\t/, $_);
    next if ($F[0] eq "-");
    if (exists $ref{$F[0]}) {next;} else {$ref{$F[0]}++; $total++;}
}
close REF;
print "$total DEGs have been saved.\n";

open (IN, "/leofs/wulin_group/zhangcm/ref/KEGG2015_human_by_pathway.txt") or die;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/06_pathway_enrichment/01_s1_DEPs_array_for_FET_MSI.txt") or die;
print OUT "Pathway\tDEGs_in_pathway\tDEGs_NOT_in_pathway\tGenome_in_pathway\tGenome_NOT_in_pathway\tDEGs\tGenome\tIn_pathway\tNOT_in_pathway\tSUM\n";
while (<IN>) {
    chomp;
    next unless ($_ =~ /^hsa/);
    my @F = split(/\t/,$_);
    my $tag = "$F[0]:$F[1]";
    my @G = split(/\|/,$F[4]);
    my $num1 = 0;
    foreach my $x (@G) {
        if (exists $ref{$x}) {$num1++;} else {next;}
    }
    my $num2 = ($total - $num1);
    my $num3 = $F[3];
    my $num4 = (25938 - $num3); ##25938 for human, and 24062 for mouse.
    my $num5 = $total;
    my $num6 = 25938;
    my $num7 = ($num1 + $num3);
    my $num8 = ($num2 + $num4);
    my $num9 = ($total + 25938);
    print OUT "$tag\t$num1\t$num2\t$num3\t$num4\t$num5\t$num6\t$num7\t$num8\t$num9\n" unless ($num1 == 0);
}
close IN;
close OUT;

