### Find Duplicate Sequences in a FASTA File
library(Biostrings)

fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
duplicates <- seqs[duplicated(as.character(seqs))]
duplicates
