#!/bin/sh
#PBS -N 01_map2geno_bwa
#PBS -o 01_map2geno_bwa.log
#PBS -j oe
#PBS -l mem=15gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

bwa=/leofs/wulin_group/panqf/install/bwa-0.7.4/bwa
indir=/leofs/wulin_group/panqf/rna/01_fq/01_fq_clean
outdir=/leofs/wulin_group/panqf/rna/02_map2geno_bwa/01_bam_bwa
samtools=/leofs/wulin_group/panqf/install/samtools-1.3.1/samtools
picard=/leofs/wulin_group/panqf/install/picard-tools-1.138/picard.jar
java=/leofs/wulin_group/panqf/install/jre1.7.0_25/bin/java
mm10=/leofs/wulin_group/panqf/ref/mm10.chroms_and_contigs.fa

##1N
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/1N_1.clean.fq.gz > $outdir/1N_1.sai && echo -n "Alignment of 1N-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/1N_2.clean.fq.gz > $outdir/1N_2.sai && echo -n "Alignment of 1N-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAARAAPEI-206\tLB:WHINSpmnpDAARAAPEI-206\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:1N' $mm10 $outdir/1N_1.sai $outdir/1N_2.sai $indir/1N_1.clean.fq.gz $indir/1N_2.clean.fq.gz > $outdir/1N.sam && echo -n "SAM of 1N is created: " && date &&
$samtools view -uS $outdir/1N.sam > $outdir/1N.bam && echo -n "SAM of 1N has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/1N.bam TMP_DIR=$outdir OUTPUT=$outdir/1N.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/1N.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##1T
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/1T_1.clean.fq.gz > $outdir/1T_1.sai && echo -n "Alignment of 1T-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/1T_2.clean.fq.gz > $outdir/1T_2.sai && echo -n "Alignment of 1T-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDABRAAPEI-207\tLB:WHINSpmnpDABRAAPEI-207\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:1T' $mm10 $outdir/1T_1.sai $outdir/1T_2.sai $indir/1T_1.clean.fq.gz $indir/1T_2.clean.fq.gz > $outdir/1T.sam && echo -n "SAM of 1T is created: " && date &&
$samtools view -uS $outdir/1T.sam > $outdir/1T.bam && echo -n "SAM of 1T has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/1T.bam TMP_DIR=$outdir OUTPUT=$outdir/1T.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/1T.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##2N
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/2N_1.clean.fq.gz > $outdir/2N_1.sai && echo -n "Alignment of 2N-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/2N_2.clean.fq.gz > $outdir/2N_2.sai && echo -n "Alignment of 2N-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDACRAAPEI-208\tLB:WHINSpmnpDACRAAPEI-208\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:2N' $mm10 $outdir/2N_1.sai $outdir/2N_2.sai $indir/2N_1.clean.fq.gz $indir/2N_2.clean.fq.gz > $outdir/2N.sam && echo -n "SAM of 2N is created: " && date &&
$samtools view -uS $outdir/2N.sam > $outdir/2N.bam && echo -n "SAM of 2N has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/2N.bam TMP_DIR=$outdir OUTPUT=$outdir/2N.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/2N.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##2T
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/2T_1.clean.fq.gz > $outdir/2T_1.sai && echo -n "Alignment of 2T-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/2T_2.clean.fq.gz > $outdir/2T_2.sai && echo -n "Alignment of 2T-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDADRAAPEI-209\tLB:WHINSpmnpDADRAAPEI-209\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:2T' $mm10 $outdir/2T_1.sai $outdir/2T_2.sai $indir/2T_1.clean.fq.gz $indir/2T_2.clean.fq.gz > $outdir/2T.sam && echo -n "SAM of 2T is created: " && date &&
$samtools view -uS $outdir/2T.sam > $outdir/2T.bam && echo -n "SAM of 2T has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/2T.bam TMP_DIR=$outdir OUTPUT=$outdir/2T.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/2T.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##3N
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/3N_1.clean.fq.gz > $outdir/3N_1.sai && echo -n "Alignment of 3N-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/3N_2.clean.fq.gz > $outdir/3N_2.sai && echo -n "Alignment of 3N-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAERAAPEI-210\tLB:WHINSpmnpDAERAAPEI-210\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:3N' $mm10 $outdir/3N_1.sai $outdir/3N_2.sai $indir/3N_1.clean.fq.gz $indir/3N_2.clean.fq.gz > $outdir/3N.sam && echo -n "SAM of 3N is created: " && date &&
$samtools view -uS $outdir/3N.sam > $outdir/3N.bam && echo -n "SAM of 3N has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/3N.bam TMP_DIR=$outdir OUTPUT=$outdir/3N.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/3N.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##3T
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/3T_1.clean.fq.gz > $outdir/3T_1.sai && echo -n "Alignment of 3T-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/3T_2.clean.fq.gz > $outdir/3T_2.sai && echo -n "Alignment of 3T-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAFRAAPEI-211\tLB:WHINSpmnpDAFRAAPEI-211\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:3T' $mm10 $outdir/3T_1.sai $outdir/3T_2.sai $indir/3T_1.clean.fq.gz $indir/3T_2.clean.fq.gz > $outdir/3T.sam && echo -n "SAM of 3T is created: " && date &&
$samtools view -uS $outdir/3T.sam > $outdir/3T.bam && echo -n "SAM of 3T has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/3T.bam TMP_DIR=$outdir OUTPUT=$outdir/3T.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/3T.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##4N
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/4N_1.clean.fq.gz > $outdir/4N_1.sai && echo -n "Alignment of 4N-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/4N_2.clean.fq.gz > $outdir/4N_2.sai && echo -n "Alignment of 4N-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAGRAAPEI-212\tLB:WHINSpmnpDAGRAAPEI-212\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:4N' $mm10 $outdir/4N_1.sai $outdir/4N_2.sai $indir/4N_1.clean.fq.gz $indir/4N_2.clean.fq.gz > $outdir/4N.sam && echo -n "SAM of 4N is created: " && date &&
$samtools view -uS $outdir/4N.sam > $outdir/4N.bam && echo -n "SAM of 4N has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/4N.bam TMP_DIR=$outdir OUTPUT=$outdir/4N.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/4N.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##4T
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/4T_1.clean.fq.gz > $outdir/4T_1.sai && echo -n "Alignment of 4T-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/4T_2.clean.fq.gz > $outdir/4T_2.sai && echo -n "Alignment of 4T-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAHRAAPEI-213\tLB:WHINSpmnpDAHRAAPEI-213\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:1N' $mm10 $outdir/4T_1.sai $outdir/4T_2.sai $indir/4T_1.clean.fq.gz $indir/4T_2.clean.fq.gz > $outdir/4T.sam && echo -n "SAM of 4T is created: " && date &&
$samtools view -uS $outdir/4T.sam > $outdir/4T.bam && echo -n "SAM of 4T has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/4T.bam TMP_DIR=$outdir OUTPUT=$outdir/4T.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/4T.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##5N
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/5N_1.clean.fq.gz > $outdir/5N_1.sai && echo -n "Alignment of 5N-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/5N_2.clean.fq.gz > $outdir/5N_2.sai && echo -n "Alignment of 5N-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAKRAAPEI-218\tLB:WHINSpmnpDAKRAAPEI-218\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:5N' $mm10 $outdir/5N_1.sai $outdir/5N_2.sai $indir/5N_1.clean.fq.gz $indir/5N_2.clean.fq.gz > $outdir/5N.sam && echo -n "SAM of 5N is created: " && date &&
$samtools view -uS $outdir/5N.sam > $outdir/5N.bam && echo -n "SAM of 5N has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/5N.bam TMP_DIR=$outdir OUTPUT=$outdir/5N.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/5N.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##5T
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/5T_1.clean.fq.gz > $outdir/5T_1.sai && echo -n "Alignment of 5T-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/5T_2.clean.fq.gz > $outdir/5T_2.sai && echo -n "Alignment of 5T-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDALRAAPEI-219\tLB:WHINSpmnpDALRAAPEI-219\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:1N' $mm10 $outdir/5T_1.sai $outdir/5T_2.sai $indir/5T_1.clean.fq.gz $indir/5T_2.clean.fq.gz > $outdir/5T.sam && echo -n "SAM of 5T is created: " && date &&
$samtools view -uS $outdir/5T.sam > $outdir/5T.bam && echo -n "SAM of 5T has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/5T.bam TMP_DIR=$outdir OUTPUT=$outdir/5T.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/5T.sorted.bam && echo -n "Sorted BAM is indexed: " && date

##6N
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/6N_1.clean.fq.gz > $outdir/6N_1.sai && echo -n "Alignment of 6N-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/6N_2.clean.fq.gz > $outdir/6N_2.sai && echo -n "Alignment of 6N-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAIRAAPEI-214\tLB:WHINSpmnpDAIRAAPEI-214\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:6N' $mm10 $outdir/6N_1.sai $outdir/6N_2.sai $indir/6N_1.clean.fq.gz $indir/6N_2.clean.fq.gz > $outdir/6N.sam && echo -n "SAM of 6N is created: " && date &&
$samtools view -uS $outdir/6N.sam > $outdir/6N.bam && echo -n "SAM of 6N has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/6N.bam TMP_DIR=$outdir OUTPUT=$outdir/6N.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/6N.sorted.bam && echo -n "Sorted BAM is indexed: " && date &&

##6T
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/6T_1.clean.fq.gz > $outdir/6T_1.sai && echo -n "Alignment of 6T-1 is done: " && date &&
$bwa aln -o 1 -e 63 -i 90 -L -k 2 -l 31 -t 4 -q 10 $mm10 $indir/6T_2.clean.fq.gz > $outdir/6T_2.sai && echo -n "Alignment of 6T-2 is done: " && date &&
$bwa sampe -r '@RG\tID:160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAJRAAPEI-216\tLB:WHINSpmnpDAJRAAPEI-216\tPL:ILLUMINA\tPU:ILLUMINA\tCN:BGI\tSM:6T' $mm10 $outdir/6T_1.sai $outdir/6T_2.sai $indir/6T_1.clean.fq.gz $indir/6T_2.clean.fq.gz > $outdir/6T.sam && echo -n "SAM of 6T is created: " && date &&
$samtools view -uS $outdir/6T.sam > $outdir/6T.bam && echo -n "SAM of 6T has been converted to BAM: " && date &&
$java -Xmx2G -jar $picard SortSam INPUT=$outdir/6T.bam TMP_DIR=$outdir OUTPUT=$outdir/6T.sorted.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT && echo -n "BAM is sorted: " && date &&
$samtools index $outdir/6T.sorted.bam && echo -n "Sorted BAM is indexed: " && date
