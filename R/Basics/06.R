### Reverse-complement DNA sequences in a FASTA file
library(Biostrings)
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
rev_complement <- reverseComplement(seqs)
writeXStringSet(rev_complement, "reverse_complement.fasta")
