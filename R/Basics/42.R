### Identify Differentially Expressed Genes from a Gene Expression Matrix

library(DESeq2)

# Load the gene expression matrix
data <- read.csv("gene_expression_matrix.csv", row.names = 1)

# Create DESeqDataSet (requires colData for sample conditions)
colData <- data.frame(row.names = colnames(data), condition = c("Control", "Control", "Treatment", "Treatment"))
dds <- DESeqDataSetFromMatrix(countData = data, colData = colData, design = ~ condition)

# Run DESeq analysis
dds <- DESeq(dds)
res <- results(dds)

# Filter significant genes
significant_genes <- res[which(res$padj < 0.05), ]
write.csv(significant_genes, "significant_genes.csv")
