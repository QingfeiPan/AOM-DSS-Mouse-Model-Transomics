##Maxquant-Unique+Razor-iBAQ
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_razor_iBAQ.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_iBAQ <- intable[,2:11]

iBAQ_Log <- intable[,2:11]
for(i in 1:ncol(iBAQ_Log)) {iBAQ_Log[,i] <- log2(iBAQ_Log[,i] + 1)}
for(i in 1:nrow(iBAQ_Log)) {
    normal = c(iBAQ_Log[i,1],iBAQ_Log[i,2],iBAQ_Log[i,3],iBAQ_Log[i,4],iBAQ_Log[i,5])
    tumor = c(iBAQ_Log[i,6],iBAQ_Log[i,7],iBAQ_Log[i,8],iBAQ_Log[i,9],iBAQ_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    iBAQ_Log[i,11] <- ttest$p.value
}
P_Value <- iBAQ_Log[,11]
outtable <- cbind(Protein_ID, iBAQ_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_razor_iBAQ.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique-iBAQ
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_iBAQ.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_iBAQ <- intable[,2:11]

iBAQ_Log <- intable[,2:11]
for(i in 1:ncol(iBAQ_Log)) {iBAQ_Log[,i] <- log2(iBAQ_Log[,i] + 1)}
for(i in 1:nrow(iBAQ_Log)) {
    normal = c(iBAQ_Log[i,1],iBAQ_Log[i,2],iBAQ_Log[i,3],iBAQ_Log[i,4],iBAQ_Log[i,5])
    tumor = c(iBAQ_Log[i,6],iBAQ_Log[i,7],iBAQ_Log[i,8],iBAQ_Log[i,9],iBAQ_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    iBAQ_Log[i,11] <- ttest$p.value
}
P_Value <- iBAQ_Log[,11]
outtable <- cbind(Protein_ID, iBAQ_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_iBAQ.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique+Razor-LFQ
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s1_quant_extract_unique_razor_LFQ.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_LFQ <- intable[,2:11]

LFQ_Log <- intable[,2:11]
for(i in 1:ncol(LFQ_Log)) {LFQ_Log[,i] <- log2(LFQ_Log[,i] + 1)}
for(i in 1:nrow(LFQ_Log)) {
    normal = c(LFQ_Log[i,1],LFQ_Log[i,2],LFQ_Log[i,3],LFQ_Log[i,4],LFQ_Log[i,5])
    tumor = c(LFQ_Log[i,6],LFQ_Log[i,7],LFQ_Log[i,8],LFQ_Log[i,9],LFQ_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    LFQ_Log[i,11] <- ttest$p.value
}
P_Value <- LFQ_Log[,11]
outtable <- cbind(Protein_ID, LFQ_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_razor_LFQ.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique-LFQ
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s2_quant_extract_unique_LFQ.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_LFQ <- intable[,2:11]

LFQ_Log <- intable[,2:11]
for(i in 1:ncol(LFQ_Log)) {LFQ_Log[,i] <- log2(LFQ_Log[,i] + 1)}
for(i in 1:nrow(LFQ_Log)) {
    normal = c(LFQ_Log[i,1],LFQ_Log[i,2],LFQ_Log[i,3],LFQ_Log[i,4],LFQ_Log[i,5])
    tumor = c(LFQ_Log[i,6],LFQ_Log[i,7],LFQ_Log[i,8],LFQ_Log[i,9],LFQ_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    LFQ_Log[i,11] <- ttest$p.value
}
P_Value <- LFQ_Log[,11]
outtable <- cbind(Protein_ID, LFQ_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_LFQ.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique+Razor-TMT
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_razor_TMT.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_TMT <- intable[,2:11]

TMT_Log <- intable[,2:11]
for(i in 1:ncol(TMT_Log)) {TMT_Log[,i] <- log2(TMT_Log[,i] + 1)}
for(i in 1:nrow(TMT_Log)) {
    normal = c(TMT_Log[i,1],TMT_Log[i,2],TMT_Log[i,3],TMT_Log[i,4],TMT_Log[i,5])
    tumor = c(TMT_Log[i,6],TMT_Log[i,7],TMT_Log[i,8],TMT_Log[i,9],TMT_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    TMT_Log[i,11] <- ttest$p.value
}
P_Value <- TMT_Log[,11]
outtable <- cbind(Protein_ID, TMT_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_razor_TMT.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique-TMT
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_TMT.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_TMT <- intable[,2:11]

TMT_Log <- intable[,2:11]
for(i in 1:ncol(TMT_Log)) {TMT_Log[,i] <- log2(TMT_Log[,i] + 1)}
for(i in 1:nrow(TMT_Log)) {
    normal = c(TMT_Log[i,1],TMT_Log[i,2],TMT_Log[i,3],TMT_Log[i,4],TMT_Log[i,5])
    tumor = c(TMT_Log[i,6],TMT_Log[i,7],TMT_Log[i,8],TMT_Log[i,9],TMT_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    TMT_Log[i,11] <- ttest$p.value
}
P_Value <- TMT_Log[,11]
outtable <- cbind(Protein_ID, TMT_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_TMT.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##ProteomeDiscoverer-Unique-TMT
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_TMT_PD.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1]
Protein_TMT <- intable[,2:11]

TMT_Log <- intable[,2:11]
for(i in 1:ncol(TMT_Log)) {TMT_Log[,i] <- log2(TMT_Log[,i] + 1)}
for(i in 1:nrow(TMT_Log)) {
    normal = c(TMT_Log[i,1],TMT_Log[i,2],TMT_Log[i,3],TMT_Log[i,4],TMT_Log[i,5])
    tumor = c(TMT_Log[i,6],TMT_Log[i,7],TMT_Log[i,8],TMT_Log[i,9],TMT_Log[i,10])
    ttest <- t.test(normal, tumor, alternative = "two.sided", paired = T)
    TMT_Log[i,11] <- ttest$p.value
}
P_Value <- TMT_Log[,11]
outtable <- cbind(Protein_ID, TMT_Log[,1:10], P_Value)
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/02_quant_pvalue_unique_TMT_PD.txt", sep = "\t", quot = F, row.names = F, col.names = T)
