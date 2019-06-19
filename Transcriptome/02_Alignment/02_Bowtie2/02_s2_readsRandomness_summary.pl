#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/01_reads_per_window";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;

open (OUT, "> /leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/02_summary_for_R.txt") or die;
my $title = join("\t", @sample);
print OUT "Window\tPosition\t$title\n";

my %hash = ();
for(my$i=0;$i<@sample;$i++) {
    open (IN, "$indir/$sample[$i].reads_per_window.txt") or die;
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Gene_Mapped/);
        my @F = split(/\t/);
        for my $x (1 .. 200) {
            $hash{$x}{$sample[$i]} += $F[$x];
        }
    }
    close IN;
}

for my $x (1 .. 200) {
    my $pos = ($x / 200);
    my $line = "$x\t$pos";
    for(my$y=0;$y<@sample;$y++) {
        $line .= "\t$hash{$x}{$sample[$y]}";
    }
    print OUT "$line\n";
}
close OUT;
