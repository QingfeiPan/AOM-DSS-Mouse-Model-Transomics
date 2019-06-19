#!/bin/sh
#PBS -N 01_cuffquant
#PBS -o 01_cuffquant.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

cuffquant=/leofs/wulin_group/panqf/install/cufflinks-2.2.1.Linux_x86_64/cuffquant
annotation=/leofs/wulin_group/panqf/ref/mm10_known_transcript.gtf
mm10=/leofs/wulin_group/panqf/ref/mm10.chroms_and_contigs.fa
indir=/leofs/wulin_group/panqf/rna/04_map2geno_tophat/01_bam_th/01_bam_th
outdir=/leofs/wulin_group/panqf/rna/04_map2geno_tophat/12_cuffdiff/01_cuffquant

##$cuffquant -o $outdir/1N -b $mm10 -p 8 --no-update-check $annotation $indir/1N/accepted_hits.bam
##$cuffquant -o $outdir/1T -b $mm10 -p 8 --no-update-check $annotation $indir/1T/accepted_hits.bam
##$cuffquant -o $outdir/2N -b $mm10 -p 8 --no-update-check $annotation $indir/2N/accepted_hits.bam
##$cuffquant -o $outdir/2T -b $mm10 -p 8 --no-update-check $annotation $indir/2T/accepted_hits.bam
$cuffquant -o $outdir/3N -b $mm10 -p 8 --no-update-check $annotation $indir/3N/accepted_hits.bam
$cuffquant -o $outdir/3T -b $mm10 -p 8 --no-update-check $annotation $indir/3T/accepted_hits.bam
$cuffquant -o $outdir/4N -b $mm10 -p 8 --no-update-check $annotation $indir/4N/accepted_hits.bam
$cuffquant -o $outdir/4T -b $mm10 -p 8 --no-update-check $annotation $indir/4T/accepted_hits.bam
##$cuffquant -o $outdir/5N -b $mm10 -p 8 --no-update-check $annotation $indir/5N/accepted_hits.bam
##$cuffquant -o $outdir/5T -b $mm10 -p 8 --no-update-check $annotation $indir/5T/accepted_hits.bam
##$cuffquant -o $outdir/6N -b $mm10 -p 8 --no-update-check $annotation $indir/6N/accepted_hits.bam
##$cuffquant -o $outdir/6T -b $mm10 -p 8 --no-update-check $annotation $indir/6T/accepted_hits.bam
