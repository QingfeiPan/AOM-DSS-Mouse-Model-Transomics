##Total
input <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/00_TCGA_Protein_Normal_Tumor.txt", header = T, sep = "\t", row.names = 1)
input_normalized <- 2^(input)
input_log <- log2(input_normalized)

for(i in 1:nrow(input_log)) {
    normal = input_log[i, 1:30]
    tumor = input_log[i, 31:120]
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = F)
    input_log[i, 120] <- ttest$p.value
}

P_value <- input_log[,120]
outtable <- cbind(P_value, input_normalized[,1:120])
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/01_DEPs_call_pvalue_Total.txt", sep = "\t", quot = F, row.names = T, col.names = T)

##MSS
input <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/01_sample_group_mss.txt", header = T, sep = "\t", row.names = 1)
input_normalized <- 2^(input)
input_log <- log2(input_normalized)

for(i in 1:nrow(input_log)) {
    normal = input_log[i, 1:30]
    tumor = input_log[i, 31:88]
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = F)
    input_log[i, 88] <- ttest$p.value
}

P_value <- input_log[,88]
outtable <- cbind(P_value, input_normalized[,1:88])
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/01_DEPs_call_pvalue_MSS.txt", sep = "\t", quot = F, row.names = T, col.names = T)

##MSI
input <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/01_sample_group_msi.txt", header = T, sep = "\t", row.names = 1)
input_normalized <- 2^(input)
input_log <- log2(input_normalized)

for(i in 1:nrow(input_log)) {
    normal = input_log[i, 1:30]
    tumor = input_log[i, 31:60]
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = F)
    input_log[i, 60] <- ttest$p.value
}

P_value <- input_log[,60]
outtable <- cbind(P_value, input_normalized[,1:60])
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/03_degs_compare/01_DEPs_call_pvalue_MSI.txt", sep = "\t", quot = F, row.names = T, col.names = T)
