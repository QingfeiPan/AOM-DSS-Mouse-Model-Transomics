#!/bin/sh
#PBS -N 01_map2gene_bowtie2
#PBS -o 01_map2gene_bowtie2.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q geneque
#HSCHED -s hschedd

bowtie2=/leofs/wulin_group/panqf/install/bowtie2-2.2.9/bowtie2
rnafa=/leofs/wulin_group/panqf/install/annovar/mousedb/mm10_refGeneMrna.fa
samtools=/leofs/wulin_group/panqf/install/samtools-1.3.1/samtools
indir=/leofs/wulin_group/panqf/rna/01_fq/01_fq_clean
outdir=/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/01_bam_bt

/leofs/wulin_group/panqf/install/bowtie2-2.2.9/bowtie2-build /leofs/wulin_group/panqf/install/annovar/mousedb/mm10_refGeneMrna.fa /leofs/wulin_group/panqf/install/annovar/mousedb/mm10_refGeneMrna.fa
$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/1N_1.clean.fq.gz -2 $indir/1N_2.clean.fq.gz | $samtools view -S -b -o $outdir/1N.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/1T_1.clean.fq.gz -2 $indir/1T_2.clean.fq.gz | $samtools view -S -b -o $outdir/1T.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/2N_1.clean.fq.gz -2 $indir/2N_2.clean.fq.gz | $samtools view -S -b -o $outdir/2N.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/2T_1.clean.fq.gz -2 $indir/2T_2.clean.fq.gz | $samtools view -S -b -o $outdir/2T.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/3N_1.clean.fq.gz -2 $indir/3N_2.clean.fq.gz | $samtools view -S -b -o $outdir/3N.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/3T_1.clean.fq.gz -2 $indir/3T_2.clean.fq.gz | $samtools view -S -b -o $outdir/3T.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/4N_1.clean.fq.gz -2 $indir/4N_2.clean.fq.gz | $samtools view -S -b -o $outdir/4N.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/4T_1.clean.fq.gz -2 $indir/4T_2.clean.fq.gz | $samtools view -S -b -o $outdir/4T.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/5N_1.clean.fq.gz -2 $indir/5N_2.clean.fq.gz | $samtools view -S -b -o $outdir/5N.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/5T_1.clean.fq.gz -2 $indir/5T_2.clean.fq.gz | $samtools view -S -b -o $outdir/5T.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/6N_1.clean.fq.gz -2 $indir/6N_2.clean.fq.gz | $samtools view -S -b -o $outdir/6N.bt2.bam
##$bowtie2 -q --phred33 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -I 1 -X 1000 --no-mixed --no-discordant -p 16 -k 200 -x $rnafa -1 $indir/6T_1.clean.fq.gz -2 $indir/6T_2.clean.fq.gz | $samtools view -S -b -o $outdir/6T.bt2.bam
