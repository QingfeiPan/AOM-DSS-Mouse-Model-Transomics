#!/bin/sh
#PBS -N Task
#PBS -o task.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

python=/leofs/wulin_group/zhangcm/install/Python-2.7.11/bin/python2.7
fpkm2tpm=/leofs/wulin_group/zhangcm/install/FPKM-TPM-master/fpkm_tpm.py
dir=/leofs/wulin_group/zhangcm/panqf/rna/04_expression/01_gene/04_summary/02_tophat2_cufflinks

python $fpkm2tpm -f $dir/1N.genes.fpkm -c 2 > $dir/1N.genes.tpm
python $fpkm2tpm -f $dir/1N.transcripts.fpkm -c 2 > $dir/1N.transcripts.tpm
python $fpkm2tpm -f $dir/1T.genes.fpkm -c 2 > $dir/1T.genes.tpm
python $fpkm2tpm -f $dir/1T.transcripts.fpkm -c 2 > $dir/1T.transcripts.tpm
python $fpkm2tpm -f $dir/2N.genes.fpkm -c 2 > $dir/2N.genes.tpm
python $fpkm2tpm -f $dir/2N.transcripts.fpkm -c 2 > $dir/2N.transcripts.tpm
python $fpkm2tpm -f $dir/2T.genes.fpkm -c 2 > $dir/2T.genes.tpm
python $fpkm2tpm -f $dir/2T.transcripts.fpkm -c 2 > $dir/2T.transcripts.tpm
python $fpkm2tpm -f $dir/3N.genes.fpkm -c 2 > $dir/3N.genes.tpm
python $fpkm2tpm -f $dir/3N.transcripts.fpkm -c 2 > $dir/3N.transcripts.tpm
python $fpkm2tpm -f $dir/3T.genes.fpkm -c 2 > $dir/3T.genes.tpm
python $fpkm2tpm -f $dir/3T.transcripts.fpkm -c 2 > $dir/3T.transcripts.tpm
python $fpkm2tpm -f $dir/4N.genes.fpkm -c 2 > $dir/4N.genes.tpm
python $fpkm2tpm -f $dir/4N.transcripts.fpkm -c 2 > $dir/4N.transcripts.tpm
python $fpkm2tpm -f $dir/4T.genes.fpkm -c 2 > $dir/4T.genes.tpm
python $fpkm2tpm -f $dir/4T.transcripts.fpkm -c 2 > $dir/4T.transcripts.tpm
python $fpkm2tpm -f $dir/5N.genes.fpkm -c 2 > $dir/5N.genes.tpm
python $fpkm2tpm -f $dir/5N.transcripts.fpkm -c 2 > $dir/5N.transcripts.tpm
python $fpkm2tpm -f $dir/5T.genes.fpkm -c 2 > $dir/5T.genes.tpm
python $fpkm2tpm -f $dir/5T.transcripts.fpkm -c 2 > $dir/5T.transcripts.tpm
python $fpkm2tpm -f $dir/6N.genes.fpkm -c 2 > $dir/6N.genes.tpm
python $fpkm2tpm -f $dir/6N.transcripts.fpkm -c 2 > $dir/6N.transcripts.tpm
python $fpkm2tpm -f $dir/6T.genes.fpkm -c 2 > $dir/6T.genes.tpm
python $fpkm2tpm -f $dir/6T.transcripts.fpkm -c 2 > $dir/6T.transcripts.tpm
