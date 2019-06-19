#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare";

open (REF, "$dir/04_Abundance_matrix_mouse_human_annotation.txt") or die;
my %total = (); my %mss = (); my %msi = (); my %mouse = ();
while (<REF>) {
    chomp;
    my @F = split(/\t/, $_);
    next unless ($F[2] eq "Tumor");
    $total{$F[0]}++ if ($F[1] eq "Human");
    $mss{$F[0]}++ if (($F[1] eq "Human") and ($F[3] =~ /MSS/));
    $msi{$F[0]}++ if (($F[1] eq "Human") and ($F[3] =~ /MSI/));
}
close REF;

open (IN, "$dir/03_Abundance_matrix_mouse_human_normalized_UR.txt") or die;
my %hash = (); my @sample = ();
while (<IN>) {
    chomp;
    if ($_ =~ /^GeneSymbol/) {
        @sample = split(/\t/, $_);
        foreach my $x (@sample) {$mouse{$x}++ if ($x =~ /^Mouse_T/);}
    }
    else {
        my @F = split(/\t/, $_);
        for(my$i=1;$i<@F;$i++) {
            $hash{$F[0]}{$sample[$i]} = $F[$i] unless ($F[$i] eq "NA");
        }
    }
}
close IN;

open (OUT, "> $dir/05_normalized_protein_abundance_scatter_UR.txt") or die;
print OUT "Gene\tTotal\tMSS\tMSI\tMouse\n";
for my $x (sort keys %hash) {
    my ($sum1, $sum2, $sum3, $sum4) = (0,0,0,0);
    my ($num1, $num2, $num3, $num4) = (0,0,0,0);
    for my $y1 (sort keys %total) { if (exists $hash{$x}{$y1}) { $sum1 += $hash{$x}{$y1}; $num1++; }}
    for my $y2 (sort keys %mss) { if (exists $hash{$x}{$y2}) { $sum2 += $hash{$x}{$y2}; $num2++; }}
    for my $y3 (sort keys %msi) { if (exists $hash{$x}{$y3}) { $sum3 += $hash{$x}{$y3}; $num3++; }}
    for my $y4 (sort keys %mouse) { if (exists $hash{$x}{$y4}) { $sum4 += $hash{$x}{$y4}; $num4++; }}
    next if (($num1 == 0) or ($num4 == 0));
    my ($fpkm1, $fpkm2, $fpkm3, $fpkm4) = ("NA", "NA", "NA", "NA");
    $fpkm1 = ($sum1 / $num1) unless ($num1 == 0); $fpkm2 = ($sum2 / $num2) unless ($num2 == 0);
    $fpkm3 = ($sum3 / $num3) unless ($num3 == 0); $fpkm4 = ($sum4 / $num4) unless ($num4 == 0);
    print OUT "$x\t$fpkm1\t$fpkm2\t$fpkm3\t$fpkm4\n";
}
close OUT;

