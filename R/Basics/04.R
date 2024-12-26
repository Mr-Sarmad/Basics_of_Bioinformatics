###  Extract all sequences from a multi-FASTA file longer than 500 bp
library(Biostrings)
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
long_seqs <- seqs[width(seqs) > 500]
writeXStringSet(long_seqs, "long_sequences.fasta")
