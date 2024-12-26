### Extract Promoter Regions
library(Biostrings)

fasta_file <- "C:/Users/PC/Downloads/sequence (1).fasta"
seqs <- readDNAStringSet(fasta_file)
promoters <- subseq(seqs, start=1, end=1000)
writeXStringSet(promoters, "promoters.fasta")
