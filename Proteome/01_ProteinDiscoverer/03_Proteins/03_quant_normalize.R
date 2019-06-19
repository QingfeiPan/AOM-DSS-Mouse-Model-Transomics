##TMT-Total
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_total.txt", header = T, sep = "\t")
row.names(intable) <- intable$Accession
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_Intensity <- intable[,4:13] ##Extract the protein Intensity values by MaxQuant.
for(i in 1:ncol(Protein_Intensity)) {Protein_Intensity[,i] <- (Protein_Intensity[,i])} ##Remove the "0" value in the table
for(i in 1:ncol(Protein_Intensity)) {Protein_Intensity[,i] <- (Protein_Intensity[,i] / sum(Protein_Intensity[,i]))} ##Normalized by the library size
outtable <- cbind(Protein_ID, Protein_Intensity) ##Combine the protein IDs and Intensity values
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/03_quant_normalize_total.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##TMT-NMP
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_NMP.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_iBAQ <- intable[,4:13] ##Extract the protein iBAQ values by MaxQuant.
for(i in 1:ncol(Protein_iBAQ)) {Protein_iBAQ[,i] <- (Protein_iBAQ[,i])} ##Remove the "0" value in the table
for(i in 1:ncol(Protein_iBAQ)) {Protein_iBAQ[,i] <- (Protein_iBAQ[,i] / sum(Protein_iBAQ[,i]))} ##Normalized by the library size
outtable <- cbind(Protein_ID, Protein_iBAQ) ##Combine the protein IDs and iBAQ values
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/03_quant_normalize_NMP.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##TMT-Deglyco
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_Deglyco.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_LFQ <- intable[,4:13] ##Extract the protein LFQ values by MaxQuant.
for(i in 1:ncol(Protein_LFQ)) {Protein_LFQ[,i] <- (Protein_LFQ[,i])} ##Remove the "0" value in the table
for(i in 1:ncol(Protein_LFQ)) {Protein_LFQ[,i] <- (Protein_LFQ[,i] / sum(Protein_LFQ[,i]))} ##Normalized by the library size
outtable <- cbind(Protein_ID, Protein_LFQ) ##Combine the protein IDs and LFQ values
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/03_quant_normalize_Deglyco.txt", sep = "\t", quot = F, row.names = F, col.names = T)

##TMT-Phospho
intable <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/02_quant_format_Phospho.txt", header = T, sep = "\t")
row.names(intable) <- intable$Protein_ID
Protein_ID <- intable[,1] ##Extract the protein IDs which will be used in writting table.
Protein_LFQ <- intable[,4:13] ##Extract the protein LFQ values by MaxQuant.
for(i in 1:ncol(Protein_LFQ)) {Protein_LFQ[,i] <- (Protein_LFQ[,i])} ##Remove the "0" value in the table
for(i in 1:ncol(Protein_LFQ)) {Protein_LFQ[,i] <- (Protein_LFQ[,i] / sum(Protein_LFQ[,i]))} ##Normalized by the library size
outtable <- cbind(Protein_ID, Protein_LFQ) ##Combine the protein IDs and LFQ values
write.table(outtable, "/leofs/wulin_group/zhangcm/panqf/protein/01_PD/01_tmt/03_proteins/03_quant_normalize_Phospho.txt", sep = "\t", quot = F, row.names = F, col.names = T)

