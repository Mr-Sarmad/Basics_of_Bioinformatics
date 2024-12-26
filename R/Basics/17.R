### Identify the Longest ORF
library(Biostrings)

fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
find_orf <- function(seq) max(width(ORFRegions(seq)))
longest_orf <- max(sapply(seqs, find_orf))
print(longest_orf)

