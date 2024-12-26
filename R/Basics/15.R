### Generate a BED File from a GFF File
file <- "C:/Users/PC/Downloads/Compressed/ncbi_dataset/ncbi_dataset/data/GCF_009914755.1/genomic.gff"
df <- read.delim(file, comment.char="#", header=FALSE)
colnames(df) <- c("chrom", "source", "feature", "start", "end", "score", "strand", "frame", "attribute")
df$start <- df$start - 1  # BED format is 0-based
write.table(df[, c("chrom", "start", "end")], "output.bed", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
