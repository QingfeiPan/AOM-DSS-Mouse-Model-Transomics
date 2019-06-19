input <- read.table("/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/02_Abundance_matrix_mouse_human_UR.txt", header = T, sep = "\t", row.names = 1)
mean_col <- (sum(input) / ncol(input))

for(j in 1:ncol(input)) {
    sum_col <- sum(input[,j])
    for (k in 1:nrow(input)) {
        input[k,j] <- (input[k,j] / sum_col) * mean_col
    }
}

write.table(input, "/leofs/wulin_group/zhangcm/panqf/protein/11_hgmm/04_expression_compare/03_Abundance_matrix_mouse_human_normalized_UR.txt", sep = "\t", col.names = T, row.names = T, quot = F)

