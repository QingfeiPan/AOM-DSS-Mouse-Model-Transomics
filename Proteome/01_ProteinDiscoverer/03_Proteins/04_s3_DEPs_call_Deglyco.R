##Call DEPs based on normalized Intensity values
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/03_quant_normalize_Deglyco.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Intensity_normalize <- intable[,2:11] ##Extract the normalilzed protein Intensity values which will be used in the calculatioin of foldchange.
for(i in 1:nrow(Intensity_normalize)) {
    normal = c(Intensity_normalize[i,1],Intensity_normalize[i,2],Intensity_normalize[i,3],Intensity_normalize[i,4],Intensity_normalize[i,5]) ##Make vector
    tumor = c(Intensity_normalize[i,6],Intensity_normalize[i,7],Intensity_normalize[i,8],Intensity_normalize[i,9],Intensity_normalize[i,10]) ##Make vector
    Intensity_normalize[i,11] <- (mean(normal) / mean(tumor)) ##Calculate FoldChange
}
FoldChange <- Intensity_normalize[,11] ##Extranct the protein FoldChange which will be used in writting table.

Intensity_LOG <- intable[,2:11] ##Extract the normalilzed protein Intensity values which will be used in the calculatioin of P value & FDR.
for(i in 1:ncol(Intensity_LOG)) {Intensity_LOG[,i] <- log10(Intensity_LOG[,i])} ##LOG10 transformation.
##shapiro.test(sample(Intensity_LOG[,1]), 5000) ##Normality test.

for(i in 1:nrow(Intensity_LOG)) {
    normal = c(Intensity_LOG[i,1],Intensity_LOG[i,2],Intensity_LOG[i,3],Intensity_LOG[i,4],Intensity_LOG[i,5]) ##Make vector
    tumor = c(Intensity_LOG[i,6],Intensity_LOG[i,7],Intensity_LOG[i,8],Intensity_LOG[i,9],Intensity_LOG[i,10]) ##Make vector
    temp <- t.test(normal, tumor, alternative = "two.sided", paired = T) ##Calculate P value
    Intensity_LOG[i,11] <- temp$p.value
}
Intensity_LOG[,12] <- p.adjust(Intensity_LOG$V11, method = "fdr", n = nrow(Intensity_LOG)) ##Calculate FDR
P_Value <- Intensity_LOG[,11] ##Extranct the protein P value which will be used in writting table.
FDR <- Intensity_LOG[,12] ##Extranct the protein FDR which will be used in writting table.

outtable <- cbind(Protein_ID, Intensity_normalize[,1:10], FoldChange, P_Value, FDR)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/04_s3_DEPs_call_Deglyco.txt", sep = "\t", quot = F, row.names = F, col.names = T) ##Write the total list of proteins into table.

list_up <- outtable[(outtable$FoldChange >= 2)&(outtable$FDR <= 0.1),] ##Extract Up-regulated proteins
list_down <- outtable[(outtable$FoldChange <= 0.5)&(outtable$FDR <= 0.1),] ##Extract Down-regulated proteins
write.table(list_up, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/04_s3_DEPs_call_Deglyco_up.txt", sep = "\t", quot = F, row.names = F, col.names = T)
write.table(list_down, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/04_s3_DEPs_call_Deglyco_down.txt", sep = "\t", quot = F, row.names = F, col.names = T)
