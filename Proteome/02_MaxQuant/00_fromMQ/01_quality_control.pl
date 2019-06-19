#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/00_from_MQ";
my @sample = qw/1N 1T 2N 2T 3N 3T 4N 4T 5N 5T/;

my ($total_protein_identified, $total_protein_quantified) = (0, 0);
my %protein_identified = (); my %protein_quantified = ();
my %peptide = (); my %peptide_ur = (); my %peptide_u = ();
my %distribution_peptide = (); my %distribution_peptide_ur = (); my %distribution_peptide_u = ();

open (IN, "$dir/00_proteinGroups_unique_razor_labelfree.txt") or die;
while (<IN>) {
    chomp;
    next if ($_ =~ /^Protein IDs/);
    my @F = split(/\t/, $_);
    next if ($F[1] =~ /CON__/); next if ($F[1] =~ /^REV__/);
    my $unique_peptides = ($F[30] + $F[31] + $F[32] + $F[33] + $F[34] + $F[35] + $F[36] + $F[37] + $F[38] + $F[39]);
    my $lfq = ($F[113] + $F[114] + $F[115] + $F[116] + $F[117] + $F[118] + $F[119] + $F[120] + $F[121] + $F[122]);
    $total_protein_identified++ unless ($unique_peptides == 0);
    $total_protein_quantified++ unless ($lfq == 0);
    for(my$i=0;$i<@sample;$i++) {
        my $p = $i + 10; my $p_ur = $i + 20; my $p_u = $i + 30; my $p_lfq = $i + 113;
        $protein_identified{$sample[$i]}++ if ($F[$p_u] > 0);
        $protein_quantified{$sample[$i]}++ if ($F[$p_lfq] > 0);
        $peptide{$sample[$i]} += $F[$p];
        $peptide_ur{$sample[$i]} += $F[$p_ur];
        $peptide_u{$sample[$i]} += $F[$p_u];
        $distribution_peptide{$F[$p]}{$sample[$i]}++;
        $distribution_peptide_ur{$F[$p_ur]}{$sample[$i]}++;
        $distribution_peptide_u{$F[$p_u]}{$sample[$i]}++;
    }
}
close IN;
print "$total_protein_identified proteins were identified and $total_protein_quantified proteins were quantified.\n";

open (OUT1, "> $dir/01_quality_control_identification.txt") or die;
print OUT1 "Sample\tProteins_Identified\tProteins_Quantified\tPeptides_Total\tPeptides_Unique+Razor\tPeptides_Unique\n";
for(my$i=0;$i<@sample;$i++) {
    print OUT1 "$sample[$i]\t$protein_identified{$sample[$i]}\t$protein_quantified{$sample[$i]}\t$peptide{$sample[$i]}\t$peptide_ur{$sample[$i]}\t$peptide_u{$sample[$i]}\n";
}
close OUT1;

open (OUT2, "> $dir/01_quality_control_peptide_distribution.txt") or die;
print OUT2 "Frequency\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\n";
for my $x (sort keys %distribution_peptide) {
    my $line = $x;
    for(my$i=0;$i<@sample;$i++) {
        $distribution_peptide{$x}{$sample[$i]} = 0 unless (exists $distribution_peptide{$x}{$sample[$i]});
        $line .= "\t$distribution_peptide{$x}{$sample[$i]}";
    }
    print OUT2 "$line\n";
}
close OUT2;

open (OUT3, "> $dir/01_quality_control_peptide_unique_razor_distribution.txt") or die;
print OUT3 "Frequency\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\n";
for my $x (sort keys %distribution_peptide_ur) {
    my $line = $x;
    for(my$i=0;$i<@sample;$i++) {
        $distribution_peptide_ur{$x}{$sample[$i]} = 0 unless (exists $distribution_peptide_ur{$x}{$sample[$i]});
        $line .= "\t$distribution_peptide_ur{$x}{$sample[$i]}";
    }
    print OUT3 "$line\n";
}
close OUT3;

open (OUT4, "> $dir/01_quality_control_peptide_unique_distribution.txt") or die;
print OUT4 "Frequency\t1N\t1T\t2N\t2T\t3N\t3T\t4N\t4T\t5N\t5T\n";
for my $x (sort keys %distribution_peptide_u) {
    my $line = $x;
    for(my$i=0;$i<@sample;$i++) {
        $distribution_peptide_u{$x}{$sample[$i]} = 0 unless (exists $distribution_peptide_u{$x}{$sample[$i]});
        $line .= "\t$distribution_peptide_u{$x}{$sample[$i]}";
    }
    print OUT4 "$line\n";
}
close OUT4;


