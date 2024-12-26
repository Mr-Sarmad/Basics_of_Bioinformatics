library(Biostrings)

# Function to calculate GC content
calculate_gc_content <- function(dna_sequence) {
  gc_count <- sum(tolower(dna_sequence) %in% c("g", "c"))
  return((gc_count / nchar(dna_sequence)) * 100)
}

# Path to your FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Calculate and print GC content for each sequence
for (seq_id in names(sequences)) {
  dna_sequence <- sequences[[seq_id]]
  gc_content <- calculate_gc_content(dna_sequence)
  cat(sprintf("GC Content for %s: %.2f%%\n", seq_id, gc_content))
}
