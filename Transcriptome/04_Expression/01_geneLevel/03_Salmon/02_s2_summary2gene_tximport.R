##source("http://bioconductor.org/biocLite.R")
##biocLite("tximport")
library("tximport")
tx2gene <- read.csv("/leofs/wulin_group/panqf/rna/05_salmon/02_s1_prepare_tx2gene.csv", header=FALSE)

##1N
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/1N/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/1N/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/1N.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/1N.transcript.txt", sep="\t", quote=FALSE)

##1T
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/1T/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/1T/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/1T.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/1T.transcript.txt", sep="\t", quote=FALSE)

##2N
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/2N/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/2N/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/2N.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/2N.transcript.txt", sep="\t", quote=FALSE)

##2T
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/2T/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/2T/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/2T.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/2T.transcript.txt", sep="\t", quote=FALSE)

##3N
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/3N/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/3N/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/3N.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/3N.transcript.txt", sep="\t", quote=FALSE)

##3T
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/3T/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/3T/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/3T.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/3T.transcript.txt", sep="\t", quote=FALSE)

##4N
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/4N/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/4N/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/4N.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/4N.transcript.txt", sep="\t", quote=FALSE)

##4T
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/4T/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/4T/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/4T.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/4T.transcript.txt", sep="\t", quote=FALSE)

##5N
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/5N/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/5N/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/5N.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/5N.transcript.txt", sep="\t", quote=FALSE)

##5T
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/5T/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/5T/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/5T.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/5T.transcript.txt", sep="\t", quote=FALSE)

##6N
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/6N/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/6N/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/6N.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/6N.transcript.txt", sep="\t", quote=FALSE)

##6T
txi_g <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/6T/quant.sf", type = "salmon", txIn=TRUE, txOut=FALSE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
txi_t <- tximport(files="/leofs/wulin_group/panqf/rna/05_salmon/01_quantify_salmon/6T/quant.sf", type = "salmon", txIn=TRUE, txOut=TRUE, countsFromAbundance="no", tx2gene=tx2gene, geneIdCol="Gene_ID", txIdCol="Transcript_ID", abundanceCol="Abundance", countsCol="Estimated_counts", lengthCol="Length", ignoreTxVersion = FALSE)
write.table(txi_g, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/6T.gene.txt", sep="\t", quote=FALSE)
write.table(txi_t, file="/leofs/wulin_group/panqf/rna/05_salmon/02_s2_summary2gene/6T.transcript.txt", sep="\t", quote=FALSE)

