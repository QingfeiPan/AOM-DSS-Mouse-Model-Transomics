#!/usr/bin/perl

use strict;
use warnings;

my %length = ();
open (REF, "/leofs/wulin_group/panqf/install/annovar/mousedb/mm10_refGeneMrna_fasta.txt") or die;
while (<REF>) {
    chomp;
    my @F = split(/\s+/, $_);
    $F[0] =~ s/^>//g;
    $length{$F[0]} = $F[2];
}
close REF;

my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T 6N 6T/;
for(my$i=0;$i<@sample;$i++) {
    print "$sample[$i] is processing...\n";
    open (IN, "samtools view /leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/01_bam_bt/$sample[$i].bt2.bam |") or die;
    my %gene_mapped = (); my %hash = (); my %reads_counted = ();
    while (<IN>) {
        chomp;
        my @F = split(/\s+/, $_);
        next if (exists $reads_counted{"$F[0]:$F[2]:$F[3]"});
        $reads_counted{"$F[0]:$F[2]:$F[3]"}++;
        if ($F[2] eq "*") {
            next;
        }
        else {
            my $start = (int($F[3]/($length{$F[2]} / 200)) + 1);
            my $end = (int(($F[3] + 99)/($length{$F[2]} / 200)) + 1);
            $gene_mapped{$F[2]}++;
            for my $x ($start .. $end) {
                $hash{$F[2]}{$x}++;
            }
        }
    }
    close IN;

    open (OUT, "> /leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/01_reads_per_window/$sample[$i].reads_per_window.txt") or die;
    my $title = "Gene_Mapped"; for my $x (1 .. 200) {$title .= "\tWindow$x";}
    print OUT "$title\n";
    for my $x (sort keys %gene_mapped) {
        my $line = $x;
        for my $y (1 .. 200) {
            $hash{$x}{$y} = 0 unless (exists $hash{$x}{$y});
            $line .= "\t$hash{$x}{$y}";
        }
        print OUT "$line\n";
    }
    close OUT;
}
