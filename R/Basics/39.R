### Find motifs in a given DNA sequence using regular expressions
library(Biostrings)

# Function to find motifs in a DNA sequence
find_motifs <- function(dna_sequence, motif) {
  positions <- gregexpr(motif, dna_sequence)[[1]]
  return(positions)
}

# Example usage with a FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Loop through each sequence and find motifs
for (seq_id in names(sequences)) {
  dna_sequence <- as.character(sequences[[seq_id]])  # Convert DNAString to character string
  motif_positions <- find_motifs(dna_sequence, "GC")  # Search for "GC" motif
  
  cat(sprintf("Motif positions for %s: %s\n", seq_id, toString(motif_positions)))
}

