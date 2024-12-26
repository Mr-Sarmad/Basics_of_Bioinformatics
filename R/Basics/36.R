### Simulate random mutations in a DNA sequence with a given mutation
library(Biostrings)

# Function to mutate a DNA sequence with a given mutation rate
mutate_dna <- function(dna_sequence, mutation_rate) {
  bases <- c("A", "C", "G", "T")
  
  # Apply mutation: For each base, mutate with the given mutation rate
  mutated <- sapply(strsplit(dna_sequence, NULL)[[1]], function(base) {
    if (runif(1) < mutation_rate) {
      sample(bases, 1)  # Sample a new base
    } else {
      base  # Keep the original base
    }
  })
  
  return(paste0(mutated, collapse = ""))
}

# Path to your FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Loop through each sequence in the FASTA file
for (seq_id in names(sequences)) {
  dna_sequence <- as.character(sequences[[seq_id]])  # Convert DNAString to character string
  
  # Mutate the DNA sequence with a 10% mutation rate
  mutated_sequence <- mutate_dna(dna_sequence, mutation_rate = 0.1)
  
  # Print the original and mutated sequences
  cat(sprintf("Original Sequence for %s:\n%s\n", seq_id, dna_sequence))
  cat(sprintf("Mutated Sequence for %s:\n%s\n", seq_id, mutated_sequence))
}

