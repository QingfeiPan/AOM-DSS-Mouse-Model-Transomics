#!/usr/bin/perl

use strict;
use warnings;

open (IN, "/leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene.knownIsoforms.txt") or die;
open (OUT, "> /leofs/wulin_group/panqf/rna/05_salmon/02_s1_prepare_tx2gene.csv") or die;
while (<IN>) {
    chomp;
    my @F = split(/\t/,$_);
    print OUT "$F[1],$F[0]\n";
}
close IN;
close OUT;
