#!/bin/sh
#PBS -N 02_fq_clean_
#PBS -o 02_fq_clean.log
#PBS -j oe
#PBS -l mem=5gb,walltime=99:99:99,nodes=1:ppn=5
#PBS -q bioque
#HSCHED -s hschedd

fq_filter=/leofs/wulin_group/panqf/rna/01_fq/01_fq_clean.pl
indir=/leofs/wulin_group/panqf/rna/01_fq/00_fq_raw
outdir=/leofs/wulin_group/panqf/rna/01_fq/01_fq_clean

##perl $fq_filter $indir/1N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAARAAPEI-206_1.fq.gz $indir/1N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAARAAPEI-206_2.fq.gz $indir/1N/1.adapter.list.gz $indir/1N/2.adapter.list.gz $outdir/1N_1.clean.fq.gz $outdir/1N_2.clean.fq.gz $outdir/1N_1.dirty.list $outdir/1N_2.dirty.list
##perl $fq_filter $indir/1T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDABRAAPEI-207_1.fq.gz $indir/1T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDABRAAPEI-207_2.fq.gz $indir/1T/1.adapter.list.gz $indir/1T/2.adapter.list.gz $outdir/1T_1.clean.fq.gz $outdir/1T_2.clean.fq.gz $outdir/1T_1.dirty.list $outdir/1T_2.dirty.list &&
##perl $fq_filter $indir/2N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDACRAAPEI-208_1.fq.gz $indir/2N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDACRAAPEI-208_2.fq.gz $indir/2N/1.adapter.list.gz $indir/2N/2.adapter.list.gz $outdir/2N_1.clean.fq.gz $outdir/2N_2.clean.fq.gz $outdir/2N_1.dirty.list $outdir/2N_2.dirty.list &&
##perl $fq_filter $indir/2T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDADRAAPEI-209_1.fq.gz $indir/2T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDADRAAPEI-209_2.fq.gz $indir/2T/1.adapter.list.gz $indir/2T/2.adapter.list.gz $outdir/2T_1.clean.fq.gz $outdir/2T_2.clean.fq.gz $outdir/2T_1.dirty.list $outdir/2T_2.dirty.list &&
##perl $fq_filter $indir/3N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAERAAPEI-210_1.fq.gz $indir/3N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAERAAPEI-210_2.fq.gz $indir/3N/1.adapter.list.gz $indir/3N/2.adapter.list.gz $outdir/3N_1.clean.fq.gz $outdir/3N_2.clean.fq.gz $outdir/3N_1.dirty.list $outdir/3N_2.dirty.list &&
##perl $fq_filter $indir/3T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAFRAAPEI-211_1.fq.gz $indir/3T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAFRAAPEI-211_2.fq.gz $indir/3T/1.adapter.list.gz $indir/3T/2.adapter.list.gz $outdir/3T_1.clean.fq.gz $outdir/3T_2.clean.fq.gz $outdir/3T_1.dirty.list $outdir/3T_2.dirty.list &&
##perl $fq_filter $indir/4N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAGRAAPEI-212_1.fq.gz $indir/4N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAGRAAPEI-212_2.fq.gz $indir/4N/1.adapter.list.gz $indir/4N/2.adapter.list.gz $outdir/4N_1.clean.fq.gz $outdir/4N_2.clean.fq.gz $outdir/4N_1.dirty.list $outdir/4N_2.dirty.list &&
##perl $fq_filter $indir/4T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAHRAAPEI-213_1.fq.gz $indir/4T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAHRAAPEI-213_2.fq.gz $indir/4T/1.adapter.list.gz $indir/4T/2.adapter.list.gz $outdir/4T_1.clean.fq.gz $outdir/4T_2.clean.fq.gz $outdir/4T_1.dirty.list $outdir/4T_2.dirty.list &&
##perl $fq_filter $indir/5N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAKRAAPEI-218_1.fq.gz $indir/5N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAKRAAPEI-218_2.fq.gz $indir/5N/1.adapter.list.gz $indir/5N/2.adapter.list.gz $outdir/5N_1.clean.fq.gz $outdir/5N_2.clean.fq.gz $outdir/5N_1.dirty.list $outdir/5N_2.dirty.list &&
##perl $fq_filter $indir/5T/160428_I136_FCH7TJ3BBXX_L7_WHINSpmnpDALRAAPEI-219_1.fq.gz $indir/5T/160428_I136_FCH7TJ3BBXX_L7_WHINSpmnpDALRAAPEI-219_2.fq.gz $indir/5T/1.adapter.list.gz $indir/5T/2.adapter.list.gz $outdir/5T_1.clean.fq.gz $outdir/5T_2.clean.fq.gz $outdir/5T_1.dirty.list $outdir/5T_2.dirty.list &&
##perl $fq_filter $indir/6N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAIRAAPEI-214_1.fq.gz $indir/6N/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAIRAAPEI-214_2.fq.gz $indir/6N/1.adapter.list.gz $indir/6N/2.adapter.list.gz $outdir/6N_1.clean.fq.gz $outdir/6N_2.clean.fq.gz $outdir/6N_1.dirty.list $outdir/6N_2.dirty.list &&
##perl $fq_filter $indir/6T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAJRAAPEI-216_1.fq.gz $indir/6T/160501_I137_FCH7NLVBBXX_L4_WHINSpmnpDAJRAAPEI-216_2.fq.gz $indir/6T/1.adapter.list.gz $indir/6T/2.adapter.list.gz $outdir/6T_1.clean.fq.gz $outdir/6T_2.clean.fq.gz $outdir/6T_1.dirty.list $outdir/6T_2.dirty.list
