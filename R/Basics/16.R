### Remove Sequences with Ambiguous Bases (e.g., N)
library(Biostrings)

fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
cleaned <- seqs[!grepl("N", as.character(seqs))]
writeXStringSet(cleaned, "cleaned.fasta")
