#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/panqf/protein/02_tmt/01_PSMs/01_PSM_raw";
my @sample = qw/QF_Deglyco_PSMs QF_Phospho_PSMs QF_NMP_PSMs/;
for(my$i=0;$i<@sample;$i++) {
    open (IN, "$dir/$sample[$i].raw.txt") or die;
    open (OUT, "> $dir/$sample[$i].txt") or die;
    while (<IN>) {
        chomp;
        my @F = split(/\t/, $_);
        my @H = ();
        for (my$i=0;$i<@F;$i++) {
            $F[$i] =~ /^\"(.*)\"/;
            push @H, $1;
        }
        my $line = join("\t", @H);
        print OUT "$line\n";
    }
    close IN;
    close OUT;
}
