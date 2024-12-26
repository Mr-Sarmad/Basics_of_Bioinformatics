### Convert RNA sequences into DNA sequences

library(Biostrings)

# Function to convert RNA to DNA
rna_to_dna <- function(rna_sequence) {
  return(gsub("U", "T", rna_sequence))
}

# Example usage with a FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Loop through each sequence and convert RNA to DNA
for (seq_id in names(sequences)) {
  rna_sequence <- as.character(sequences[[seq_id]])  # Convert DNAString to character string
  dna_sequence <- rna_to_dna(rna_sequence)  # Convert RNA to DNA
  
  cat(sprintf("Converted DNA sequence for %s: %s\n", seq_id, dna_sequence))
}
