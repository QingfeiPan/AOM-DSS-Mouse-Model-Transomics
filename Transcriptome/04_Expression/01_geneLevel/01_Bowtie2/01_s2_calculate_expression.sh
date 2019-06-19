#!/bin/sh
#PBS -N 12_calculate_expression
#PBS -o 12_calculate_expression.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

bowtie2=/leofs/wulin_group/panqf/install/bowtie2-2.2.9/bowtie2
RSEM=/software/biosoft/software/rsem-1.2.15
indir=/leofs/wulin_group/panqf/rna/01_fq/01_fq_clean
outdir=/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/12_rsem_expression
fasta=/leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene.transcripts.fa

##Build index files for Bowtie2 with fasta-formated reference gene
/leofs/wulin_group/panqf/install/bowtie2-2.2.9/bowtie2-build $fasta $fasta

$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/1N_1.clean.fq.gz $indir/1N_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/1N
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/1T_1.clean.fq.gz $indir/1T_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/1T
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/2N_1.clean.fq.gz $indir/2N_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/2N
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/2T_1.clean.fq.gz $indir/2T_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/2T
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/3N_1.clean.fq.gz $indir/3N_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/3N
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/3T_1.clean.fq.gz $indir/3T_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/3T
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/4N_1.clean.fq.gz $indir/4N_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/4N
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/4T_1.clean.fq.gz $indir/7T_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/4T
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/5N_1.clean.fq.gz $indir/5N_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/5N
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/5T_1.clean.fq.gz $indir/5T_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/5T
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/6N_1.clean.fq.gz $indir/6N_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/6N
$RSEM/rsem-calculate-expression --bowtie2 -p 8 --paired-end $indir/6T_1.clean.fq.gz $indir/6T_2.clean.fq.gz /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene $outdir/6T
