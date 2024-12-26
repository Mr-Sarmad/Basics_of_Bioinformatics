### Extract and Save Unique Gene Names from a GTF File
file <- "C:/Users/PC/Downloads/Compressed/ncbi_dataset_2/ncbi_dataset/data/GCF_000001405.40/genomic.gtf"
df <- read.delim(file, comment.char="#", header=FALSE)
colnames(df) <- c("seqname", "source", "feature", "start", "end", "score", "strand", "frame", "attribute")
genes <- unique(gsub('.*gene_name "([^"]+)".*', '\\1', df$attribute))
write(genes, "unique_genes.txt")
