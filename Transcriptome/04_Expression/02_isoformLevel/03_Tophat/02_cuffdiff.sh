#!/bin/sh
#PBS -N 02_cuffdiff
#PBS -o 02_cuffdiff.log
#PBS -j oe
#PBS -l mem=8gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q geneque
#HSCHED -s AOM_DSS+Cufflinks+Mouse

cuffdiff=/leofs/wulin_group/zhangcm/install/cufflinks-2.2.1.Linux_x86_64/cuffdiff
annotation=/leofs/wulin_group/zhangcm/ref/reference/mm10/TopHat/mm10_Novel_Known.gtf
mm10=/leofs/wulin_group/zhangcm/ref/reference/mm10/TopHat/mm10.fa
indir=/leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/01_bam_th
outdir=/leofs/wulin_group/zhangcm/panqf/rna/04_expression/03_tophat/02_cuffdiff

##$cuffdiff -o $outdir/1T -L 1N,1T -b $mm10 --no-update-check $annotation $indir/1N/accepted_hits.bam $indir/1T/accepted_hits.bam
##$cuffdiff -o $outdir/2T -L 2N,2T -b $mm10 --no-update-check $annotation $indir/2N/accepted_hits.bam $indir/2T/accepted_hits.bam
##$cuffdiff -o $outdir/3T -L 3N,3T -b $mm10 --no-update-check $annotation $indir/3N/accepted_hits.bam $indir/3T/accepted_hits.bam
##$cuffdiff -o $outdir/4T -L 4N,4T -b $mm10 --no-update-check $annotation $indir/4N/accepted_hits.bam $indir/4T/accepted_hits.bam
##$cuffdiff -o $outdir/5T -L 5N,5T -b $mm10 --no-update-check $annotation $indir/5N/accepted_hits.bam $indir/5T/accepted_hits.bam
##$cuffdiff -o $outdir/6T -L 6N,6T -b $mm10 --no-update-check $annotation $indir/6N/accepted_hits.bam $indir/6T/accepted_hits.bam

##$cuffdiff -o $outdir/six -L Normal6,Tumor6 -b $mm10 --no-update-check $annotation $indir/1N/accepted_hits.bam,$indir/2N/accepted_hits.bam,$indir/3N/accepted_hits.bam,$indir/4N/accepted_hits.bam,$indir/5N/accepted_hits.bam,$indir/6N/accepted_hits.bam $indir/1T/accepted_hits.bam,$indir/2T/accepted_hits.bam,$indir/3T/accepted_hits.bam,$indir/4T/accepted_hits.bam,$indir/5T/accepted_hits.bam,$indir/6T/accepted_hits.bam
