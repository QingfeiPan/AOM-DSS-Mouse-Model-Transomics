#!/bin/sh
#PBS -N 01_quantify_salmon
#PBS -o 01_quantify_salmon.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

salmon=/leofs/wulin_group/panqf/install/Salmon-0.7.2_linux_x86_64/bin/salmon
index=/leofs/wulin_group/panqf/ref/Salmon_database/mm10_refGene
indir=/leofs/wulin_group/panqf/rna/01_fq/01_fq_clean
outdir=/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon

##Build index files for Salmon
$salmon index -t /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene.transcripts.fa -i $index -p 8

##Quantify with Salmon
$salmon quant -i $index -l A -1 $indir/1N_1.clean.fq.gz -2 $indir/1N_2.clean.fq.gz -p 8 -o $outdir/1N
$salmon quant -i $index -l A -1 $indir/1T_1.clean.fq.gz -2 $indir/1T_2.clean.fq.gz -p 8 -o $outdir/1T
$salmon quant -i $index -l A -1 $indir/2N_1.clean.fq.gz -2 $indir/2N_2.clean.fq.gz -p 8 -o $outdir/2N
$salmon quant -i $index -l A -1 $indir/2T_1.clean.fq.gz -2 $indir/2T_2.clean.fq.gz -p 8 -o $outdir/2T
$salmon quant -i $index -l A -1 $indir/3N_1.clean.fq.gz -2 $indir/3N_2.clean.fq.gz -p 8 -o $outdir/3N
$salmon quant -i $index -l A -1 $indir/3T_1.clean.fq.gz -2 $indir/3T_2.clean.fq.gz -p 8 -o $outdir/3T
$salmon quant -i $index -l A -1 $indir/4N_1.clean.fq.gz -2 $indir/4N_2.clean.fq.gz -p 8 -o $outdir/4N
$salmon quant -i $index -l A -1 $indir/4T_1.clean.fq.gz -2 $indir/4T_2.clean.fq.gz -p 8 -o $outdir/4T
$salmon quant -i $index -l A -1 $indir/5N_1.clean.fq.gz -2 $indir/5N_2.clean.fq.gz -p 8 -o $outdir/5N
$salmon quant -i $index -l A -1 $indir/5T_1.clean.fq.gz -2 $indir/5T_2.clean.fq.gz -p 8 -o $outdir/5T
$salmon quant -i $index -l A -1 $indir/6N_1.clean.fq.gz -2 $indir/6N_2.clean.fq.gz -p 8 -o $outdir/6N
$salmon quant -i $index -l A -1 $indir/6T_1.clean.fq.gz -2 $indir/6T_2.clean.fq.gz -p 8 -o $outdir/6T
