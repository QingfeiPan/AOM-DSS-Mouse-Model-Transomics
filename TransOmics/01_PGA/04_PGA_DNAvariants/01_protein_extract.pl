#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/00_from_Maxquant";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/01_protein_extract";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/01_protein_extract.txt") or die;
print STA "Sample\tNumber_of_proteins_identified\n";

opendir (DIR, $indir) or die;
while (my$file = readdir(DIR)) {
    next unless ($file =~ /^(\d\w)_proteinGroups.txt/);
    my $sample = $1;

    open (IN, "$indir/$file") or die;
    open (OUT, "> $outdir/$sample\_protein.txt") or die;
    my $number = 0;
    while (<IN>) {
        chomp;
        if ($_ =~ /^Protein IDs/) {
            print OUT "Protein_ID\t$_\n";
        }
        else {
            my @F = split(/\t/, $_);
            if ($F[1] =~ /;/) {
                my @G = split(/;/, $F[1]);
                for(my$i=0;$i<@G;$i++) {
                    next if ($G[$i] =~ /^CON/);
                    next if ($G[$i] =~ /^REV/);
                    print OUT "$G[$i]\t$_\n"; $number++;
                    last;
                }
            }
            else {
                next if ($F[1] =~ /^CON/);
                next if ($F[1] =~ /^REV/);
                print OUT "$F[1]\t$_\n"; $number++;
            }
        }
    }
    print STA "$sample\t$number\n";
    close IN; close OUT;
}
close STA;
