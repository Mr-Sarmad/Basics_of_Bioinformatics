### Rename the headers in a FASTA file using a predefined mapping file
library(Biostrings)
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
mapping <- read.table("C:/Users/PC/Downloads/header_mapping.txt", header = FALSE, stringsAsFactors = FALSE)
names(seqs) <- mapping[match(names(seqs), mapping[, 1]), 2]
writeXStringSet(seqs, "renamed.fasta")
