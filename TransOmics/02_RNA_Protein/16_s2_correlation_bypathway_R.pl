#!/usr/bin/perl

use strict;
use warnings;

my $dir = "/leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/16_correlation_bypathway";

open (STA, "> /leofs/wulin_group/zhangcm/panqf/omics/02_rna_protein/16_s3_correlation_bypathway_R.sh") or die;
opendir (DIR, $dir) or die;
while (my $file = readdir(DIR)) {
    next unless ($file =~ /^(mmu\d+)_input.txt/);
    my $tag = $1;

    open (OUT, "> $dir/$tag.R") or die;
    print OUT "input <- read.table(\"$dir/$tag\_input.txt\", header = T, sep = \"\\t\", row.names = 1)\n\n";
    print OUT "fpkm_median <- median(input\$FPKM)\nlfq_median <- median(input\$LFQ)\n";
    print OUT "for(i in 1:nrow(input)) {\n\tinput[,1] <- (input[,1] / fpkm_median)\n\tinput[,2] <- (input[,2] / lfq_median)\n}\n\n";
    print OUT "input_log <- log2(input)\n";
    print OUT "value <- cor.test(input_log[,1], input_log[,2], method = \"pearson\")\n";
    print OUT "write.table(c(value\$estimate, value\$p.value), file = \"$dir/$tag\_output.txt\", quote = F, sep = \"\\t\", row.names = F, col.names = F)\n";
    print STA "Rscript $dir/$tag.R\n";
}
close STA;
