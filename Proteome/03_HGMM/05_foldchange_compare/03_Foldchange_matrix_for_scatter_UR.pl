#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/05_foldchange_compare";

open (REF, "$dir/01_human_MSS_MSI_Protein_Annotation.txt") or die;
my %total = (); my %mss = (); my %msi = (); my %mouse = ();
while (<REF>) {
    chomp;
    next unless ($_ =~ /^TCGA/);
    my @F = split(/\t/, $_);
    next unless ($F[1] eq "Tumor");
    $total{$F[0]}++;
    $mss{$F[0]}++ if ($F[2] =~ /MSS/);
    $msi{$F[0]}++ if ($F[2] =~ /MSI/);
}
close REF;

open (IN, "$dir/02_foldchange_human_mouse_UR.txt") or die;
my %hash = (); my @sample = ();
while (<IN>) {
    chomp;
    if ($_ =~ /^Gene/) {
        @sample = split(/\t/, $_);
        foreach my $x (@sample) {$mouse{$x}++ if ($x =~ /^Mouse/);}
    }
    else {
        my @F = split(/\t/, $_);
        for(my$i=1;$i<@F;$i++) {
            $hash{$F[0]}{$sample[$i]} = $F[$i] unless ($F[$i] eq "NA");
        }
    }
}
close IN;

open (OUT, "> $dir/03_Foldchange_matrix_for_scatter_UR.txt") or die;
print OUT "Gene\tTotal\tMSS\tMSI\tMouse\n";
for my $x (sort keys %hash) {
    my ($sum1, $sum2, $sum3, $sum4) = (0,0,0,0);
    my ($num1, $num2, $num3, $num4) = (0,0,0,0);
    for my $y1 (sort keys %total) { if (exists $hash{$x}{$y1}) { $sum1 += $hash{$x}{$y1}; $num1++; }}
    for my $y2 (sort keys %mss) { if (exists $hash{$x}{$y2}) { $sum2 += $hash{$x}{$y2}; $num2++; }}
    for my $y3 (sort keys %msi) { if (exists $hash{$x}{$y3}) { $sum3 += $hash{$x}{$y3}; $num3++; }}
    for my $y4 (sort keys %mouse) { if (exists $hash{$x}{$y4}) { $sum4 += $hash{$x}{$y4}; $num4++; }}
    next if (($num1 == 0) or ($num4 == 0));
    my ($fc1, $fc2, $fc3, $fc4) = ("NA", "NA", "NA", "NA");
    $fc1 = ($sum1 / $num1) unless ($num1 == 0); $fc2 = ($sum2 / $num2) unless ($num2 == 0);
    $fc3 = ($sum3 / $num3) unless ($num3 == 0); $fc4 = ($sum4 / $num4) unless ($num4 == 0);
    print OUT "$x\t$fc1\t$fc2\t$fc3\t$fc4\n";
}
close OUT;


