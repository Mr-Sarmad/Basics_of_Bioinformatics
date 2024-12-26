### Remove Duplicate Lines in a Tab-Delimited File
file <- "C:/Users/PC/Downloads/sequence_report.tsv"
df <- read.delim(file)
df <- unique(df)
write.table(df, "deduplicated.tsv", sep="\t", row.names=FALSE, quote=FALSE)
