#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/03_variant_peptides";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

open (REF1, "/leofs/wulin_group/zhangcm/panqf/rna/07_PGA/02_total/01_PGA_input/11_DNA_variants/04_DNA_total_variants_mm10.txt") or die;
my %dna = ();
while (<REF1>) {
    chomp;
    next if ($_ =~ /^#/);
    my @F = split(/\t/, $_);
    $dna{$F[0]}{$F[1]}{$F[3]}{$F[4]}++;
}
close REF1;

my %rna = ();
for(my$i=0;$i<@sample;$i++) {
    open (REF2, "/leofs/wulin_group/zhangcm/panqf/rna/07_PGA/01_bysample/01_PGA_input/sample/$sample[$i].raw.vcf") or die;
    while (<REF2>) {
        chomp;
        next if ($_ =~ /^#/);
        my @F = split(/\t/, $_);
        $rna{$F[0]}{$F[1]}{$F[3]}{$F[4]}++;
    }
    close REF2;
}

my %saav = (); my %frequency = ();
for(my$i=0;$i<@sample;$i++) {
    open (IN, "$dir/$sample[$i]_variant_peptides_mutation.txt") or die;
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Mutation_ID/);
        my @F = split(/\t/, $_);
        my @G = split(/:/, $F[5]);
        if ((exists $dna{$G[0]}{$G[1]}{$G[2]}{$G[3]}) and (!exists $rna{$G[0]}{$G[1]}{$G[2]}{$G[3]})){
            $saav{$F[1]}{$F[3]} = "$F[1]\t$F[3]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[9]\t$F[10]\tDNA";
            push @{$frequency{$F[1]}{$F[3]}}, $sample[$i];
        }
        elsif ((!exists $dna{$G[0]}{$G[1]}{$G[2]}{$G[3]}) and (exists $rna{$G[0]}{$G[1]}{$G[2]}{$G[3]})){
            $saav{$F[1]}{$F[3]} = "$F[1]\t$F[3]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[9]\t$F[10]\tRNA";
            push @{$frequency{$F[1]}{$F[3]}}, $sample[$i];
        }
        elsif ((exists $dna{$G[0]}{$G[1]}{$G[2]}{$G[3]}) and (exists $rna{$G[0]}{$G[1]}{$G[2]}{$G[3]})){
            $saav{$F[1]}{$F[3]} = "$F[1]\t$F[3]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[9]\t$F[10]\tDNA,RNA";
            push @{$frequency{$F[1]}{$F[3]}}, $sample[$i];
        }
        else {
            $saav{$F[1]}{$F[3]} = "$F[1]\t$F[3]\t$F[2]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[9]\t$F[10]\tNone";
            push @{$frequency{$F[1]}{$F[3]}}, $sample[$i];
        }
    }
    close IN;
}

open (OUT, "> /leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/03_s2_saav_summary.txt") or die;
print OUT "ProteinID\tAAChange\tGene\tBaseChange\tPosition\tdbSNP\tSomatic\tPeptideSequence\tSpectraCount\tSource\tFrequency\tSample_List\n";
for my $x (sort keys %saav) {
    for my $y (sort keys %{$saav{$x}}) {
        my $number = scalar @{$frequency{$x}{$y}};
        my $list = join(",", @{$frequency{$x}{$y}});
        print OUT "$saav{$x}{$y}\t$number\t$list\n";
    }
}
close OUT;
