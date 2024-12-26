### Parse a Tab-Delimited File and Filter Rows
library(Biostrings)
file <- "C:/Users/PC/Downloads/sequence_report.tsv"
threshold=50
df <- read.delim(file)
filtered <- subset(df, 'GC Percent' > threshold)  # Replace 'column_name' and 'threshold'
write.table(filtered, "filtered.tsv", sep="\t", row.names=FALSE, quote=FALSE)
