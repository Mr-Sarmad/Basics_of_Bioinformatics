### Merge multiple FASTA files into a single file
# Load the Biostrings library
library(Biostrings)
fasta_files <- list.files(pattern = "\\.fasta$", full.names = TRUE)
merged_seqs <- do.call(c, lapply(fasta_files, readDNAStringSet))
writeXStringSet(merged_seqs, "merged.fasta")
cat("Merged", length(fasta_files), "FASTA files into 'merged.fasta'.\n")
