### Read a FASTA file and print the sequence IDs
library(Biostrings)
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
names(seqs)
