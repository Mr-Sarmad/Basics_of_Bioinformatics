### Convert a Tab-Delimited Gene Expression Matrix to CSV
file <- "C:/Users/PC/Downloads/sequence_report.tsv"
df <- read.delim(file)
write.csv(df, "output.csv", row.names=FALSE)
