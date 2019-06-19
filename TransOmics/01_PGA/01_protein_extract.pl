#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/00_from_Maxquant";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/01_protein_extract";
my @sample = qw/PGA_1N PGA_2N PGA_3N PGA_4N PGA_5N PGA_1T PGA_2T PGA_3T PGA_4T PGA_5T STD_1N STD_2N STD_3N STD_4N STD_5N STD_1T STD_2T STD_3T STD_4T STD_5T/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/omics/01_PGA/01_protein_extract.txt") or die;
print STA "Sample\tNumber_of_proteins_identified\n";

opendir (DIR, $indir) or die;
while (my$file = readdir(DIR)) {
    next unless ($file =~ /proteinGroups/);
    my $sample;
    if ($file =~ /^(STD\w+)\_proteinGroups\_(\d+).txt/) {print "1\n";
        $sample = "$1\_$2";
    }
    elsif ($file =~ /^(PGA\w+)\_proteinGroups.txt/) {print "2\n";
        $sample = $1;
    }

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
