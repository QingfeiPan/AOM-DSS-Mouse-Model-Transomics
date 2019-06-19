##Maxquant-Unique+Razor-iBAQ
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s1_quant_extract_unique_razor_iBAQ.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_iBAQ <- intable[,2:11] ##Extract the protein Intensity values by MaxQuant.
lib_mean <- (sum(Protein_iBAQ) / 10)
for(i in 1:ncol(Protein_iBAQ)) {
    factor <- (lib_mean / sum(Protein_iBAQ[,i]))
    for(j in 1:nrow(Protein_iBAQ)) {
        Protein_iBAQ[j,i] <- (Protein_iBAQ[j,i] * factor)
    }
}
outtable <- cbind(Protein_ID, Protein_iBAQ) ##Combine the protein IDs and Intensity values
write.table(outtable,"/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_razor_iBAQ.txt", sep = "\t", quot = F, row.names = F, col.names = T)


##Maxquant-Unique-iBAQ
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s2_quant_extract_unique_iBAQ.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_iBAQ <- intable[,2:11] ##Extract the protein Intensity values by MaxQuant.
lib_mean <- (sum(Protein_iBAQ) / 10)
for(i in 1:ncol(Protein_iBAQ)) {
    factor <- (lib_mean / sum(Protein_iBAQ[,i]))
    for(j in 1:nrow(Protein_iBAQ)) {
        Protein_iBAQ[j,i] <- (Protein_iBAQ[j,i] * factor)
    }
}
outtable <- cbind(Protein_ID, Protein_iBAQ) ##Combine the protein IDs and Intensity values
write.table(outtable,"/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_iBAQ.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique+Razor-TMT
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s3_quant_extract_unique_razor_TMT.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_iBAQ <- intable[,2:11] ##Extract the protein Intensity values by MaxQuant.
lib_mean <- (sum(Protein_iBAQ) / 10)
for(i in 1:ncol(Protein_iBAQ)) {
    factor <- (lib_mean / sum(Protein_iBAQ[,i]))
    for(j in 1:nrow(Protein_iBAQ)) {
        Protein_iBAQ[j,i] <- (Protein_iBAQ[j,i] * factor)
    }
}
outtable <- cbind(Protein_ID, Protein_iBAQ) ##Combine the protein IDs and Intensity values
write.table(outtable,"/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_razor_TMT.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##Maxquant-Unique-TMT
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s4_quant_extract_unique_TMT.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_iBAQ <- intable[,2:11] ##Extract the protein Intensity values by MaxQuant.
lib_mean <- (sum(Protein_iBAQ) / 10)
for(i in 1:ncol(Protein_iBAQ)) {
    factor <- (lib_mean / sum(Protein_iBAQ[,i]))
    for(j in 1:nrow(Protein_iBAQ)) {
        Protein_iBAQ[j,i] <- (Protein_iBAQ[j,i] * factor)
    }
}
outtable <- cbind(Protein_ID, Protein_iBAQ) ##Combine the protein IDs and Intensity values
write.table(outtable,"/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_TMT.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##ProteomeDiscoverer-Unique-TMT
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/01_quant_extract/01_s5_quant_extract_unique_TMT_PD.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_iBAQ <- intable[,2:11] ##Extract the protein Intensity values by MaxQuant.
lib_mean <- (sum(Protein_iBAQ) / 10)
for(i in 1:ncol(Protein_iBAQ)) {
    factor <- (lib_mean / sum(Protein_iBAQ[,i]))
    for(j in 1:nrow(Protein_iBAQ)) {
        Protein_iBAQ[j,i] <- (Protein_iBAQ[j,i] * factor)
    }
}
outtable <- cbind(Protein_ID, Protein_iBAQ) ##Combine the protein IDs and Intensity values
write.table(outtable,"/leofs/wulin_group/zhangcm/panqf/protein/02_MaxQuant/02_DEPs_call/01_quant_normalize_unique_TMT_PD.txt", sep = "\t", quot = F, row.names = F, col.names = T)
