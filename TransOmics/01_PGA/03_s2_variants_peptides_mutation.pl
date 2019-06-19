#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/03_variant_peptides";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

my %somatic = ();
for(my$k=5;$k<@sample;$k++) {
    open (IN, "/leofs/wulin_group/zhangcm/panqf/rna/06_variants/02_variants_filter/02_variants_somatic/$sample[$k].somatic_germline.vcf") or die;
    while (<IN>) {
        chomp;
        my @F = split(/\t/, $_);
        $somatic{$F[0]}{$F[1]}{$F[3]}{$F[4]}++;
    }
    close IN;
}

for(my$i=0;$i<@sample;$i++) {
    open (REF, "/leofs/wulin_group/zhangcm/panqf/rna/07_PGA/01_bysample/01_PGA_input/mutation_annotation/01_variants/$sample[$i].raw.vcf.annovar.exonic_variant_function") or die;
    my %hash = ();
    while (<REF>) {
        chomp;
        my @F = split(/\t/, $_);
        my @G = split(/,/, $F[2]);
        for my $x (@G) {
            my @H = split(/:/, $x);
            $H[3] =~ /c\.(\w+)/; my $basechange = $1;
            $H[4] =~ /p\.(\w+)/; my $aachange = $1;
            my $somatic = 0; $somatic = 1 if (exists $somatic{$F[8]}{$F[9]}{$F[11]}{$F[12]});
            $hash{$H[1]}{$aachange} = "$basechange\t$F[8]:$F[9]:$F[11]:$F[12]\t$F[10]\t$somatic";
        }
    }
    close REF;

    open (IN, "$dir/PGA_$sample[$i]_variant_peptides.txt") or die;
    open (OUT, "> $dir/PGA_$sample[$i]_variant_peptides_mutation.txt") or die;
    while (<IN>) {
        chomp;
        if ($_ =~ /^Variant_event/) {
            print OUT "Mutation_ID\tProtein\tGene\tAAChange\tBaseChange\tPosition\tdbSNP\tSomatic\t$_\n";
        }
        else {
            my @F = split(/\t/, $_);
            if ($F[0] =~ /VAR\|SNV/) {
                my @G = split(/\|/, $F[0]);
                $G[3] =~ /(\w(\d+).)(NM_\d+)/;
                my $aachange = $1; my $pos = $2; my $tr = $3;
                next unless (($pos >= $F[8]) and ($pos <= $F[9]));
                $hash{$tr}{$aachange} = "-\t-" unless (exists $hash{$tr}{$aachange});
                print OUT "$G[1]\t$G[2]\t$G[4]\t$aachange\t$hash{$tr}{$aachange}\t$_\n";
            }
            elsif ($F[0] =~ /VAR\|IDL/) {
                my @G = split(/\|/, $F[0]);
                $G[3] =~ /(\d+)/; my $pos = $1;
                next unless ((($pos/3) >= $F[8]) and (($pos/3) <= $F[9]));
                print OUT "$G[1]\t$G[2]\t$G[5]\t-\t$G[3]\t-\t-\t-\t$_\n";
            }
        }
    }
    close IN; close OUT;
}
