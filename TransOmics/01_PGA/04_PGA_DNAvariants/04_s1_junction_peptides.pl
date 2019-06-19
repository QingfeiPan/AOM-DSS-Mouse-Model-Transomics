#!/usr/bin/perl

use strict;
use warnings;

my $dir1 = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/03_variant_peptides";
my $dir2 = "/leofs/wulin_group/zhangcm/panqf/rna/07_PGA/01_bysample/02_PGA_output";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

for(my$i=0;$i<@sample;$i++) {
    print "$sample[$i] is processing...\n";

    open (IN, "$dir1/$sample[$i]_variant_peptides.txt") or die;
    open (OUT, "> $dir1/$sample[$i]_junction_peptides.txt") or die;
    while (<IN>) {
        chomp;
        if ($_ =~ /^Variant_event/) {
            print OUT "$_\n";
        }
        else {
            next unless ($_ =~ /^VAR\|JUC/);
            my @F = split(/\t/, $_);
            my @G = split(/\|/, $F[0]);
            $F[0] =~ /Junpos:(\d+)-(\d+)/;
            my $start = $1; my $end = $2;
            if (($F[8] <= $start) and ($F[9] >= $end)) {
                print OUT "$_\n";
            }
            else {
                print "Filtered: $_\n";
            }
        }
    }
    close IN; close OUT;
}
