###  Sort Sequences in a FASTA File by Length
library(Biostrings)

fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
seqs <- seqs[order(width(seqs), decreasing=TRUE)]
writeXStringSet(seqs, "sorted.fasta")
