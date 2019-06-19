#!/bin/sh
#PBS -N Task
#PBS -o task.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

RSEM=/software/biosoft/software/rsem-1.2.15

$RSEM/rsem-prepare-reference --gtf /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene_fix.gtf --transcript-to-gene-map /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/mm10_refGene.knownIsoforms.txt --bowtie2 --bowtie2-path /leofs/wulin_group/panqf/install/bowtie2-2.2.9 /leofs/wulin_group/panqf/install/annovar/mousedb/mm10_seq/mm10 /leofs/wulin_group/panqf/ref/RSEM_database/rsem_refseq/temp/mm10
