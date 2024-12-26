### Split a large FASTA file into smaller files containing 100 sequences each
library(Biostrings)
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
seqs <- readDNAStringSet(fasta_file)
batch_size <- 100
for (i in seq(1, length(seqs), by = batch_size)) {
  batch <- seqs[i:min(i + batch_size - 1, length(seqs))]
  writeXStringSet(batch, paste0("batch_", i, ".fasta"))
}
