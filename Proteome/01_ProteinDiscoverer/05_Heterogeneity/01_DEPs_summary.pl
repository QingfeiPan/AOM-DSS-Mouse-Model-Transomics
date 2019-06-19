#!/usr/bin/perl

use strict;
use warnings;

open (OUT1, "> /leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/01_DEPs_summary_foldchange.txt") or die;
print OUT1 "Protein\tFoldchange1\tFoldchange2\tFoldchange3\tFoldchange4\tFoldchange5\n";
open (OUT2, "> /leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/01_DEPs_summary_annotation.txt") or die;
print OUT2 "Protein\tRegulationType\n";

my %gene = (); my %up = (); my %down = ();
open (IN1, "/leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/00_DEPs_NMP.txt") or die;
while (<IN1>) {
    chomp;
    next if ($_ =~ /Protein/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {next;}else{$gene{$F[0]}++;}
    for my $i (2 .. 6) {$F[$i] = ($F[$i] - 1);}
    if ($F[1] eq "Up") {$up{$F[0]} = "$F[0]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\n";}
    elsif ($F[1] eq "Down") {$down{$F[0]} = "$F[0]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\n";}
}
close IN1;

open (IN2, "/leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/00_DEPs_Phospho.txt") or die;
while (<IN2>) {
    chomp;
    next if ($_ =~ /Protein/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {next;}else{$gene{$F[0]}++;}
    for my $i (2 .. 6) {$F[$i] = ($F[$i] - 1);}
    if ($F[1] eq "Up") {$up{$F[0]} = "$F[0]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\n";}
    elsif ($F[1] eq "Down") {$down{$F[0]} = "$F[0]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\n";}
}
close IN2;

open (IN3, "/leofs/wulin_group/panqf/protein/02_tmt/05_individual_diversity/00_DEPs_Deglyco.txt") or die;
while (<IN3>) {
    chomp;
    next if ($_ =~ /Protein/);
    my @F = split(/\t/, $_);
    if (exists $gene{$F[0]}) {next;}else{$gene{$F[0]}++;}
    for my $i (2 .. 6) {$F[$i] = ($F[$i] - 1);}
    if ($F[1] eq "Up") {$up{$F[0]} = "$F[0]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\n";}
    elsif ($F[1] eq "Down") {$down{$F[0]} = "$F[0]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\n";}
}
close IN3;

for my $x (sort keys %up) {
    print OUT1 "$up{$x}";
    print OUT2 "$x\tUp\n";
}
for my $x (sort keys %down) {
    print OUT1 "$down{$x}";
    print OUT2 "$x\tDown\n";
}
close OUT1; close OUT2;
