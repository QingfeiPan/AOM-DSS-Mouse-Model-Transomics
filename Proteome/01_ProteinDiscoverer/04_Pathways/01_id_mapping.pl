#!/usr/bin/perl

use strict;
use warnings;

open (REF1, "/leofs/wulin_group/panqf/ref/MOUSE_10090_idmapping.dat") or die;
my %ref1 = ();
while (<REF1>) {
    chomp;
    next unless ($_ =~ /Gene_Name/);
    my @F = split(/\t/, $_);
    $ref1{$F[0]} = $F[2];
}
close REF1;

open (REF2, "/leofs/wulin_group/panqf/ref/Gene_homology_mouse_to_human.txt") or die;
my %ref2 = ();
while (<REF2>) {
    chomp;
    next if ($_ =~ /^#/);
    my @F = split(/\t/, $_);
    $ref2{$F[0]} = $F[1];
}
close REF2;

my %total_p = (); my %gene_mm = (); my %gene_hg = ();

open (IN1, "/leofs/wulin_group/panqf/protein/02_tmt/04_pathway/00_DEGs_nonmod.txt") or die;
open (OUT1, "> /leofs/wulin_group/panqf/protein/02_tmt/04_pathway/01_id_mapped_nonmod.txt") or die;
print OUT1 "Protein_Accession\tGene_Name_Mouse\tGene_Name_Human\n";
while (<IN1>) {
    chomp;
    my @F = split(/\t/, $_);
    $total_p{$F[0]}++;
    if (exists $ref1{$F[0]}) {
        $gene_mm{$F[0]} = $ref1{$F[0]};
        if (exists $ref2{$ref1{$F[0]}}) {
            $gene_hg{$F[0]} = $ref2{$ref1{$F[0]}};
            print OUT1 "$F[0]\t$ref1{$F[0]}\t$ref2{$ref1{$F[0]}}\n";
        }
        else {
            $gene_hg{$F[0]} = "-";
            print OUT1 "$F[0]\t$ref1{$F[0]}\t-\n";
        }
    }
    else {
        $gene_mm{$F[0]} = "-";
        print OUT1 "$F[0]\t-\t-\n";
    }
}
close IN1; close OUT1;

open (IN2, "/leofs/wulin_group/panqf/protein/02_tmt/04_pathway/00_DEGs_phospho.txt") or die;
open (OUT2, "> /leofs/wulin_group/panqf/protein/02_tmt/04_pathway/01_id_mapped_phospho.txt") or die;
print OUT2 "Protein_Accession\tGene_Name_Mouse\tGene_Name_Human\n";
while (<IN2>) {
    chomp;
    my @F = split(/\t/, $_);
    $total_p{$F[0]}++;
    if (exists $ref1{$F[0]}) {
        $gene_mm{$F[0]} = $ref1{$F[0]};
        if (exists $ref2{$ref1{$F[0]}}) {
            $gene_hg{$F[0]} = $ref2{$ref1{$F[0]}};
            print OUT2 "$F[0]\t$ref1{$F[0]}\t$ref2{$ref1{$F[0]}}\n";
        }
        else {
            $gene_hg{$F[0]} = "-";
            print OUT2 "$F[0]\t$ref1{$F[0]}\t-\n";
        }
    }
    else {
        $gene_mm{$F[0]} = "-";
        print OUT2 "$F[0]\t-\t-\n";
    }
}
close IN2; close OUT2;

open (IN3, "/leofs/wulin_group/panqf/protein/02_tmt/04_pathway/00_DEGs_deglyco.txt") or die;
open (OUT3, "> /leofs/wulin_group/panqf/protein/02_tmt/04_pathway/01_id_mapped_deglyco.txt") or die;
print OUT3 "Protein_Accession\tGene_Name_Mouse\tGene_Name_Human\n";
while (<IN3>) {
    chomp;
    my @F = split(/\t/, $_);
    $total_p{$F[0]}++;
    if (exists $ref1{$F[0]}) {
        $gene_mm{$F[0]} = $ref1{$F[0]};
        if (exists $ref2{$ref1{$F[0]}}) {
            $gene_hg{$F[0]} = $ref2{$ref1{$F[0]}};
            print OUT3 "$F[0]\t$ref1{$F[0]}\t$ref2{$ref1{$F[0]}}\n";
        }
        else {
            $gene_hg{$F[0]} = "-";
            print OUT3 "$F[0]\t$ref1{$F[0]}\t-\n";
        }
    }
    else {
        $gene_mm{$F[0]} = "-";
        print OUT3 "$F[0]\t-\t-\n";
    }
}
close IN3; close OUT3;

open (OUT4, "> /leofs/wulin_group/panqf/protein/02_tmt/04_pathway/01_id_mapped_total.txt") or die;
print OUT4 "Protein_Accession\tGene_Name_Mouse\tGene_Name_Human\n";
for my $x (sort keys %total_p) {
    print OUT4 "$x\t$gene_mm{$x}\t$gene_hg{$x}\n";
}
close OUT4;
