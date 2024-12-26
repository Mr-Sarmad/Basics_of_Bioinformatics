### Convert a multi-line FASTA format into a single-line FASTA format
library(Biostrings)
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
writeXStringSet(seqs, "single_line.fasta", format = "fasta", width = 10000)
