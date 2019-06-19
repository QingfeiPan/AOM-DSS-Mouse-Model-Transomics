#!/usr/bin/perl

use strict;
use warnings;

open (REF, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/00_TCGA_CRC_Patients.txt") or die;
my %mss = (); my %msi = ();
while (<REF>) {
    chomp;
    next if ($_ =~ /^#/);
    my @F = split(/\t/, $_);
    if ($F[6] =~ /MSS/) {$mss{$F[4]}++;}
    elsif ($F[6] =~ /MSI/) {$msi{$F[4]}++;}
}
close REF;

open (IN, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/00_TCGA_Protein_Normal_Tumor.txt") or die;
my %hash = (); my @title = (); my %gene = ();
my ($total, $mss, $msi) = (0,0,0);
my @total = (); my @mss = (); my @msi = ();
while (<IN>) {
    chomp;
    if ($_ =~ /GeneSymbol/) {
        @title = split(/\t/, $_);
        for(my$i=1;$i<@title;$i++) {
            if ($title[$i] =~ /^JX/) {
                push @total, $title[$i]; push @mss, $title[$i]; push @msi, $title[$i];
            }
            elsif ($title[$i] =~ /^(TCGA-\w+-\w+)-/) {
                push @total, $title[$i]; $total++;
                my $tag = $1;
                if (exists $mss{$tag}) {push @mss, $title[$i]; $mss++;}
                if (exists $msi{$tag}) {push @msi, $title[$i]; $msi++;}
            }
        }
    }
    else {
        my @F = split(/\t/, $_);
        $gene{$F[0]}++;
        for(my$i=1;$i<@F;$i++) {
            $hash{$F[0]}{$title[$i]} = $F[$i];
        }
    }
}
close IN;
print "$total tumor samples were found, including $mss MSS and $msi MSI.\n";

open (OUT1, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_sample_group_mss.txt") or die;
my $title1 = join("\t", @mss);
print OUT1 "GeneSymbol\t$title1\n";
for my $x (sort keys %gene) {
    my $line = $x;
    for(my$i=0;$i<@mss;$i++) {
        $line .= "\t$hash{$x}{$mss[$i]}";
    }
    print OUT1 "$line\n";
}
close OUT1;

open (OUT2, "> /leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_sample_group_msi.txt") or die;
my $title2 = join("\t", @msi);
print OUT2 "GeneSymbol\t$title2\n";
for my $x (sort keys %gene) {
    my $line = $x;
    for(my$i=0;$i<@msi;$i++) {
        $line .= "\t$hash{$x}{$msi[$i]}";
    }
    print OUT2 "$line\n";
}
close OUT2;
