#!/bin/sh
#PBS -N 01_bam_th
#PBS -o 01_bam_th.log
#PBS -j oe
#PBS -l mem=8gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q geneque
#HSCHED -s AOM_DSS+TopHat+Mouse

tophat=/leofs/wulin_group/zhangcm/install/tophat-2.1.0.Linux_x86_64/tophat
outdir=/leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/01_bam_th
fasta=/leofs/wulin_group/zhangcm/ref/reference/mm10/Bowtie/mm10.fa
indir=/leofs/wulin_group/zhangcm/panqf/rna/01_fq/01_fq_clean
knowntranscript=/leofs/wulin_group/zhangcm/ref/reference/mm10/TopHat/mm10_Novel_Known.gtf

##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/1N_new $fasta $indir/1N_1.clean.fq.gz $indir/1N_2.clean.fq.gz
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/1T $fasta $indir/1T_1.clean.fq.gz $indir/1T_2.clean.fq.gz
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/2N $fasta $indir/2N_1.clean.fq.gz $indir/2N_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/2T $fasta $indir/2T_1.clean.fq.gz $indir/2T_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/3N $fasta $indir/3N_1.clean.fq.gz $indir/3N_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/3T $fasta $indir/3T_1.clean.fq.gz $indir/3T_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/4N $fasta $indir/4N_1.clean.fq.gz $indir/4N_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/4T $fasta $indir/4T_1.clean.fq.gz $indir/4T_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/5N $fasta $indir/5N_1.clean.fq.gz $indir/5N_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/5T $fasta $indir/5T_1.clean.fq.gz $indir/5T_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/6N $fasta $indir/6N_1.clean.fq.gz $indir/6N_2.clean.fq.gz &&
##$tophat -p 8 --solexa-quals --segment-length 30 --segment-mismatches 2 -r 20 --mate-std-dev 20 -G $knowntranscript --library-type fr-unstranded -o $outdir/6T $fasta $indir/6T_1.clean.fq.gz $indir/6T_2.clean.fq.gz


