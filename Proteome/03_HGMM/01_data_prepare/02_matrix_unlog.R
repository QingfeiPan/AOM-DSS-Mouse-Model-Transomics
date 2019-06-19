input <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/00_TCGA_Protein_Normal_Tumor.txt", header = T, sep = "\t")
row.names(input) <- input[,1]
table <- input[,2:ncol(input)]
ID <- input[,1]

table_out <- 2^(table)
output <- cbind(ID, table_out)
write.table(table_out, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/01_data_prepare/02_TCGA_Protein_Normal_Tumor_unlogged.txt", sep = "\t", row.names = T, col.names = T, quot = F)
