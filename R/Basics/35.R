### Calculate pairwise sequence identity between two FASTA files
library(Biostrings)

pairwise_identity <- function(file1, file2) {
  seq1 <- as.character(readDNAStringSet(file1)[[1]])
  seq2 <- as.character(readDNAStringSet(file2)[[1]])
  matches <- sum(strsplit(seq1, "")[[1]] == strsplit(seq2, "")[[1]])
  return((matches / nchar(seq1)) * 100)
}
pairwise_identity("C:/Users/PC/Downloads/sequence (3).fasta", "C:/Users/PC/Downloads/sequence (2).fasta")
