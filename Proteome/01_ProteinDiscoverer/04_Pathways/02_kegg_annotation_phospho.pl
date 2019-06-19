#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/panqf/protein/02_tmt/04_pathway/01_id_mapped_phospho.txt") or die;
my %ref = (); my $total = 0;
while (<REF>) {
    chomp;
    next if ($_ =~ /^Protein_Accession/);
    my @F = split(/\t/, $_);
    next if ($F[1] eq "-");
    if (exists $ref{$F[1]}) {
        next;
    }
    else {
        $ref{$F[1]}++; $total++;
    }
}
close REF;

open (IN, "/leofs/wulin_group/panqf/ref/KEGG2015_by_pathway.txt") or die;
open (OUT, "> /leofs/wulin_group/panqf/protein/02_tmt/04_pathway/02_array_for_FET_phospho.txt") or die;
print OUT "Pathway\tDEGs_in_pathway\tDEGs_NOT_in_pathway\tGenome_in_pathway\tGenome_NOT_in_pathway\tDEGs\tGenome\tIn_pathway\tNOT_in_pathway\tSUM\n";
while (<IN>) {
    chomp;
    next unless ($_ =~ /^mmu/);
    my @F = split(/\t/,$_);
    my $tag = $F[0];
    my @G = split(/\|/,$F[4]);
    my $num1 = 0;
    foreach my $x (@G) {
        if (exists $ref{$x}) {
            $num1++;
        }
        else {
            next;
        }
    }
    my $num2 = ($total - $num1);
    my $num3 = $F[3];
    my $num4 = (24062 - $num3);
    my $num5 = $total;
    my $num6 = 24062;
    my $num7 = ($num1 + $num3);
    my $num8 = ($num2 + $num4);
    my $num9 = ($total + 24062);
    print OUT "$tag\t$num1\t$num2\t$num3\t$num4\t$num5\t$num6\t$num7\t$num8\t$num9\n" unless ($num1 == 0);
}
close IN;
close OUT;

