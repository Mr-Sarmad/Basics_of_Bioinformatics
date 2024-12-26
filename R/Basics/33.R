### Translate DNA sequence into corresponding protein sequence
library(Biostrings)

# Function to calculate GC content
calculate_gc_content <- function(dna_sequence) {
  gc_count <- sum(tolower(strsplit(dna_sequence, NULL)[[1]]) %in% c("g", "c"))
  return((gc_count / nchar(dna_sequence)) * 100)
}

# Function to translate DNA sequence into corresponding protein sequence
translate_dna <- function(dna_sequence) {
  dna <- DNAString(dna_sequence)
  return(as.character(translate(dna)))
}

# Path to your FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Loop through each sequence in the FASTA file
for (seq_id in names(sequences)) {
  dna_sequence <- as.character(sequences[[seq_id]])  # Convert DNAString to character string
  
  # Calculate and print GC content
  gc_content <- calculate_gc_content(dna_sequence)
  cat(sprintf("GC Content for %s: %.2f%%\n", seq_id, gc_content))
  
  # Translate and print protein sequence
  protein_sequence <- translate_dna(dna_sequence)
  cat(sprintf("Protein Sequence for %s: %s\n", seq_id, protein_sequence))
}

