#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call";
my @sample = qw/unique_razor_iBAQ unique_razor_LFQ unique_iBAQ unique_LFQ unique_razor_TMT unique_TMT unique_TMT_PD/;

open (STA, "> /leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/04_DEPs_extract_statistics.txt") or die;
print STA "Sample\tUp-Regulated\tDown-Regulated\n";

for(my$i=0;$i<@sample;$i++) {
    my %pvalue = ();
    open (REF, "$dir/02_quant_pvalue_$sample[$i].txt") or die;
    while (<REF>) {
        chomp;
        next if ($_ =~ /^Protein_ID/);
        my @F = split(/\t/, $_);
        if ($F[11] <= 0.05) {$pvalue{$F[0]} = $F[11];}
    }
    close REF;

    open (IN, "$dir/03_quant_foldchange_$sample[$i].txt") or die;
    open (OUT, "> $dir/04_DEPs_extract_$sample[$i].txt") or die;
    my ($up, $down) = (0, 0);
    while (<IN>) {
        chomp;
        my @F = split(/\t/, $_);
        if ($F[0] =~ /^Protein_ID/) {
            print OUT "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\tPvalue\tRegulation\n";
        }
        else {
            next unless (exists $pvalue{$F[0]});
            if ($F[12] eq "Up") {
                print OUT "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$pvalue{$F[0]}\tUp\n"; $up++;
            }
            elsif ($F[12] eq "Down") {
                print OUT "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\t$F[5]\t$F[6]\t$F[7]\t$F[8]\t$F[9]\t$F[10]\t$F[11]\t$pvalue{$F[0]}\tDown\n"; $down++;
            }
            else {
                next;
            }
        }
    }
    print STA "$sample[$i]\t$up\t$down\n";
    close IN; close OUT;
}
close STA;
