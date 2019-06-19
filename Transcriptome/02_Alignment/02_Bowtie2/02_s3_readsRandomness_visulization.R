library(ggplot2)
library(tidyr)
library(dplyr)
data <- read.table("/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/02_summary_for_R.txt", header=T)
x <- data$Position

##1N
y1n <- data$X1N
p1n <- ggplot(data=data, aes(x=x, y=y1n)) + geom_line() + labs(title="Reads Randomness of Sample (1N)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_1N.png", plot = p1n, width = 20, height = 20, units = "cm")
##1T
y1t <- data$X1T
p1t <- ggplot(data=data, aes(x=x, y=y1t)) + geom_line() + labs(title="Reads Randomness of Sample (1T)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_1T.png", plot = p1t, width = 20, height = 20, units = "cm")
##2N
y2n <- data$X2N
p2n <- ggplot(data=data, aes(x=x, y=y2n)) + geom_line() + labs(title="Reads Randomness of Sample (2N)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_2N.png", plot = p2n, width = 20, height = 20, units = "cm")
##2T
y2t <- data$X2T
p2t <- ggplot(data=data, aes(x=x, y=y2t)) + geom_line() + labs(title="Reads Randomness of Sample (2T)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_2T.png", plot = p2t, width = 20, height = 20, units = "cm")
##3N
y3n <- data$X3N
p3n <- ggplot(data=data, aes(x=x, y=y3n)) + geom_line() + labs(title="Reads Randomness of Sample (3N)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_3N.png", plot = p3n, width = 20, height = 20, units = "cm")
##3T
y3t <- data$X3T
p3t <- ggplot(data=data, aes(x=x, y=y3t)) + geom_line() + labs(title="Reads Randomness of Sample (3T)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_3T.png", plot = p3t, width = 20, height = 20, units = "cm")
##4N
y4n <- data$X4N
p4n <- ggplot(data=data, aes(x=x, y=y4n)) + geom_line() + labs(title="Reads Randomness of Sample (4N)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_4N.png", plot = p4n, width = 20, height = 20, units = "cm")
##4T
y4t <- data$X4T
p4t <- ggplot(data=data, aes(x=x, y=y4t)) + geom_line() + labs(title="Reads Randomness of Sample (4T)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_4T.png", plot = p4t, width = 20, height = 20, units = "cm")
##5N
y5n <- data$X5N
p5n <- ggplot(data=data, aes(x=x, y=y5n)) + geom_line() + labs(title="Reads Randomness of Sample (5N)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_5N.png", plot = p5n, width = 20, height = 20, units = "cm")
##5T
y5t <- data$X5T
p5t <- ggplot(data=data, aes(x=x, y=y5t)) + geom_line() + labs(title="Reads Randomness of Sample (5T)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_5T.png", plot = p5t, width = 20, height = 20, units = "cm")
##6N
y6n <- data$X6N
p6n <- ggplot(data=data, aes(x=x, y=y6n)) + geom_line() + labs(title="Reads Randomness of Sample (6N)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_6N.png", plot = p6n, width = 20, height = 20, units = "cm")
##6T
y6t <- data$X6T
p6t <- ggplot(data=data, aes(x=x, y=y6t)) + geom_line() + labs(title="Reads Randomness of Sample (6T)", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_6T.png", plot = p6t, width = 20, height = 20, units = "cm")

##Total
tide <- data %>% gather(Sample, Reads, X1N:X1T:X2N:X2T:X3N:X3T:X4N:X4T:X5N:X5T:X6N:X6T)
tide$Sample <- gsub("^X", "", tide$Sample)
p <- ggplot(data=tide, aes(x=Position, y=Reads, group = Sample)) + geom_line(aes(colour = factor(Sample))) + labs(title="Reads Randomness of Samples", x="Relative Position in Genes(5' -> 3')(200 Windows)", y="Reads Number of Each Window") + theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = "/leofs/wulin_group/panqf/rna/03_map2gene_bowtie2/03_reads_randomness/03_R_plots/Reads_randomness_Total.png", plot = p, width = 24, height = 20, units = "cm")
