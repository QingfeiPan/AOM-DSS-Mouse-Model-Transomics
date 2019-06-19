#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

my ($in_fq1, $in_fq2, $in_adapter1, $in_adapter2, $out_fq1, $out_fq2, $out_dirty1, $out_dirty2) = @ARGV;
my $filename = basename $out_fq1;
my $dirname = File::Basename::dirname $out_fq1;
$filename =~ /^(\d\w)_1/;
my $sample = $1;

open (AD1, "gzip -cd $in_adapter1 |") or die;
open (AD2, "gzip -cd $in_adapter2 |") or die;

my %hash_ad;
while (<AD1>) {
    chomp;
    next if ($_ =~ /^#/);
    my $id1 = (split (/\t/, $_))[0];
    $id1 = "@".$id1;
    $hash_ad{$id1} = 1;
}
while (<AD2>) {
    chomp;
    next if ($_ =~ /^#/);
    my $id2 = (split (/\t/, $_))[0];
    $id2 = "@".$id2;
    $hash_ad{$id2} = 2;
}
close AD1; close AD2;
my $time1=`date +%F' '%H:%M:%S`;
print 'complete the hash at time  '.$time1;

open (FQ1, "gzip -cd $in_fq1 |") or die;
open (FQ2, "gzip -cd $in_fq2 |") or die;
open (OUT1, "| gzip > $out_fq1") or die;
open (OUT2, "| gzip > $out_fq2") or die;
open (DIRTY1, "> $out_dirty1") or die;
open (DIRTY2, "> $out_dirty2") or die;

my (@fq1, @fq2);
my ($Num1, $Num1f, $Num1c, $Num2, $Num2f, $Num2c);
my ($a,$n,$q) = (0,0,0);
while ((defined ($fq1[0] = <FQ1>)) && (defined ($fq2[0] = <FQ2>))) {
    $Num1++; $Num2++;
    $fq1[1] = <FQ1>; $fq2[1] = <FQ2>;
    $fq1[2] = <FQ1>; $fq2[2] = <FQ2>;
    $fq1[3] = <FQ1>; $fq2[3] = <FQ2>;
    chomp (@fq1, @fq2);

    my $len_1 = length $fq1[1];
    my $Nnum_1 = $fq1[1] =~ tr/N//;
    my $Nrate_1 = $Nnum_1/$len_1;

    my $len_2 = length $fq2[1];
    my $Nnum_2 = $fq2[1] =~ tr/N//;
    my $Nrate_2 = $Nnum_2/$len_2;

    my @qual_1 = split (//, $fq1[3]);
    my $Qnum_1 = 0;
    foreach my $qual_1 (@qual_1) {
        my $Q_1 = ord($qual_1) - 33;
        $Qnum_1++ if $Q_1 <= 10;
    }
    my $Qrate_1 = $Qnum_1/$len_1;

    my @qual_2 = split (//, $fq2[3]);
    my $Qnum_2 = 0;
    foreach my $qual_2 (@qual_2) {
        my $Q_2 = ord($qual_2) - 33;
        $Qnum_2++ if $Q_2 <= 10;
    }
    my $Qrate_2 = $Qnum_2/$len_2;

    my @mark = ();
    if ((exists $hash_ad{$fq1[0]}) or (exists $hash_ad{$fq2[0]})) {
        push @mark, "A"; $a++;
    }
    if (($Nrate_1 > 0.1) or ($Nrate_2 > 0.1)) {
        push @mark, "N"; $n++;
    }
    if (($Qrate_1 > 0.5) or ($Qrate_2 > 0.5)) {
        push @mark, "Q"; $q++;
    }

    my $array_n = @mark;
    $fq1[0] =~ s/\s/:/g; $fq2[0] =~ s/\s/:/g;
    if ($array_n > 0) {
        my $line = join("", @mark);
        print DIRTY1 "$fq1[0]\t$line\n"; $Num1f++;
        print DIRTY2 "$fq2[0]\t$line\n"; $Num2f++;
    }
    else {
        my $out_1 = join ("\n", @fq1);
        print OUT1 $out_1."\n"; $Num1c++;
        my $out_2 = join ("\n", @fq2);
        print OUT2 $out_2."\n"; $Num2c++;
    }
}
close FQ1; close FQ2; close OUT1; close OUT2; close DIRTY1; close DIRTY2;

open (STA, "> $dirname/$sample.clean.stat") or die;
my $total = $Num1 + $Num2;
my $clean = $Num1c + $Num2c;
my $dirty = $Num1f + $Num2f;
$a = 2 * $a; $n = 2* $n; $q = 2 * $q;
printf STA "Total:\t$total\t%.6f%%\n", 100;
printf STA "Clean:\t$clean\t%.6f%%\n", ($clean / $total * 100);
printf STA "Dirty:\t$dirty\t%.6f%%\n", ($dirty / $total * 100);
printf STA "Adapter:\t$a\t%.6f%%\n", ($a / $total * 100);
printf STA "N_base:\t$n\t%.6f%%\n", ($n / $total * 100);
printf STA "Low_qual:\t$q\t%.6f%%\n", ($q / $total * 100);
print "Filtration of $sample is done!\n";
