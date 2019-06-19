#!/usr/bin/perl

use strict;
use warnings;

my $indir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/00_from_Maxquant";
my $outdir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/03_variant_peptides";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

for(my$i=0;$i<@sample;$i++) {
    open (IN, "$indir/$sample[$i]_peptides.txt") or die;
    open (OUT, "> $outdir/$sample[$i]_variant_peptides.txt") or die;
    print OUT "Variant_event\tPeptide_Sequence\tMS/MS_Count\tPeptide_Length\tPeptide_Mass\tPeptide_Charge\tProteins_Related\tLeading_Razor_Protein\tStart_Position\tEnd_Position\tUnique(Groups)\tUnique(Proteins)\tPEP\tIntensity\n";
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Sequence/);
        my @F = split(/\t/, $_);
        my $msms_count = 0;
        if ($F[66] =~ /;/) {my @temp = split(/;/, $F[66]);$msms_count = @temp;} else {$msms_count = 1;}
        if ($F[35] =~ /;/) {
            my @G = split(/;/, $F[35]);
            for my $x (@G) {
                next unless ($x =~ /^VAR/);
                print OUT "$x\t$F[0]\t$msms_count\t$F[31]\t$F[33]\t$F[40]\t$F[34]\t$F[35]\t$F[36]\t$F[37]\t$F[38]\t$F[39]\t$F[41]\t$F[58]\n";
            }
        }
        else {
            next unless ($F[35] =~ /^VAR/);
            print OUT "$F[35]\t$F[0]\t$msms_count\t$F[31]\t$F[33]\t$F[40]\t$F[34]\t$F[35]\t$F[36]\t$F[37]\t$F[38]\t$F[39]\t$F[41]\t$F[58]\n";
        }
    }
    close IN; close OUT;
}
