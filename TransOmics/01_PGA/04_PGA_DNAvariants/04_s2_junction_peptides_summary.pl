#!/usr/bin/perl

use strict;
use warnings;

open (REF1, "/leofs/wulin_group/zhangcm/install/annovar/mousedb/mm10_refGene.txt") or die;
my %hash = ();
while (<REF1>) {
    chomp;
    my @F = split(/\t/, $_);
    $hash{$F[1]} = $F[12];
}
close REF1;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/03_variant_peptides";
my @samples = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;
open (OUT, "> /leofs/wulin_group/zhangcm/panqf/omics/01_PGA/11_PGA_DNA_variants/04_s2_junction_peptides_summary.txt") or die;
print OUT "Junction_ID\tSample\tPos1_Transcript\tPos1_Gene\tPos2_Transcript\tPos2_Gene\tVariant_event\tPeptide_Sequence\tMS/MS_Count\tPeptide_Length\tPeptide_Mass\tPeptide_Charge\tProteins_Related\tLeading_Razor_Protein\tStart_Position\tEnd_Position\tUnique(Groups)\tUnique(Proteins)\tPEP\tIntensity\n";
for(my$i=0;$i<@samples;$i++) {
    open (IN, "$dir/$samples[$i]_junction_peptides.txt") or die;
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Variant_event/);
        my @F = split(/\t/, $_);
        my @G = split(/\|/, $F[0]);
        my $junc = "$G[2]\|$G[3]";
        my @pos1_g = (); my @pos2_g = ();
        if ($G[5] =~ /,/) {
            my @tr = split(/,/, $G[5]);
            for my $x (@tr) {push @pos1_g, $hash{$x} if (exists $hash{$x});}
        }
        else {
            push @pos1_g, $hash{$G[5]} if (exists $hash{$G[5]});
        }
        if ($G[6] =~ /,/) {
            my @tr = split(/,/, $G[6]);
            for my $x (@tr) {push @pos2_g, $hash{$x} if (exists $hash{$x});}
        }
        else {
            push @pos2_g, $hash{$G[6]} if (exists $hash{$G[6]});
        }
        my %count1 = (); my @unique_pos1_g = grep{++$count1{$_} < 2}@pos1_g;
        my %count2 = (); my @unique_pos2_g = grep{++$count2{$_} < 2}@pos2_g;
        my $pos1_g = ""; my $pos2_g = "";
        if (@unique_pos1_g > 0) { $pos1_g = join(",", @unique_pos1_g); } else { $pos1_g = "NA"; }
        if (@unique_pos2_g > 0) { $pos2_g = join(",", @unique_pos2_g); } else { $pos2_g = "NA"; }
        print OUT "$junc\t$samples[$i]\t$G[5]\t$pos1_g\t$G[6]\t$pos2_g\t$_\n";
    }
    close IN;
}
close OUT;

