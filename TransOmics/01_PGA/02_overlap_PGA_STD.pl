#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/01_PGA/01_protein_extract";
my @sample = qw/1N 2N 3N 4N 5N 1T 2T 3T 4T 5T/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/omics/01_PGA/02_overlap_PGA_STD.txt") or die;
print STA "Sample\tPGA_total\tPGA_variants\tPGA_NoverTr\tPGA_Junction\tPGA_SNV\tPGA_INDEL\tPGA_Standard\tSTD_total\tSTD_overlap\tSTD_unique\n";

for(my$i=0;$i<@sample;$i++) {
    open (REF, "$dir/PGA_$sample[$i]_protein.txt") or die;
    my %pga_np = ();
    my ($pga_total, $pga_np, $pga_var, $pga_ntx, $pga_juc, $pga_snv, $pga_idl) = (0,0,0,0,0,0,0);
    while (<REF>) {
        chomp;
        next if ($_ =~ /^Protein_ID/);
        $pga_total++;
        my @F = split(/\t/, $_);
        if ($F[0] =~ /^NP/) {
            $pga_np++;
            $pga_np{$F[0]}++;
        }
        else {
            $pga_var++;
            $pga_ntx++ if ($F[0] =~ /^VAR\|NTX/);
            $pga_juc++ if ($F[0] =~ /^VAR\|JUC/);
            $pga_snv++ if ($F[0] =~ /^VAR\|SNV/);
            $pga_idl++ if ($F[0] =~ /^VAR\|IDL/);
        }
    }
    close REF;

    open (IN, "$dir/STD_$sample[$i]_30181_protein.txt") or die;
    my ($std_total, $std_overlap, $std_unique) = (0,0,0);
    while (<IN>) {
        chomp;
        next if ($_ =~ /^Protein_ID/);
        my @F = split(/\t/, $_);
        $std_total++;
        if (exists $pga_np{$F[0]}) {
            $std_overlap++;
        }
        else {
            $std_unique++;
        }
    }
    close IN;

    print STA "$sample[$i]\t$pga_total\t$pga_var\t$pga_ntx\t$pga_juc\t$pga_snv\t$pga_idl\t$pga_np\t$std_total\t$std_overlap\t$std_unique\n";
}
