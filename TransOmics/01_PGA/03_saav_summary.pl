#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/03_variant_peptides";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

my %saav = (); my %frequency = ();
for(my$i=0;$i<@sample;$i++) {
    open (IN, "$dir/PGA_$sample[$i]_variant_peptides_mutation.txt") or die;
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Mutation_ID/);
        my @F = split(/\t/, $_);
        $saav{$F[1]}{$F[3]} = "$F[1]\t$F[3]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[9]\t$F[10]";
        push @{$frequency{$F[1]}{$F[3]}}, $sample[$i];
    }
    close IN;
}

open (OUT, "> /leofs/wulin_group/zhangcm/panqf/omics/01_PGA/03_saav_summary.txt") or die;
print OUT "ProteinID\tAAChange\tGene\tBaseChange\tPosition\tdbSNP\tSomatic\tPeptideSequence\tSpectraCount\tFrequency\tSample_List\n";
for my $x (sort keys %saav) {
    for my $y (sort keys %{$saav{$x}}) {
        my $number = scalar @{$frequency{$x}{$y}};
        my $list = join(",", @{$frequency{$x}{$y}});
        print OUT "$saav{$x}{$y}\t$number\t$list\n";
    }
}
close OUT;
