### Sliding window algorithm to calculate GC content in a genome
library(Biostrings)

# Function to calculate GC content
calculate_gc_content <- function(dna_sequence) {
  gc_count <- sum(tolower(strsplit(dna_sequence, NULL)[[1]]) %in% c("g", "c"))
  return((gc_count / nchar(dna_sequence)) * 100)
}

# Function to calculate sliding window GC content
sliding_window_gc_content <- function(dna_sequence, window_size) {
  gc_contents <- sapply(1:(nchar(dna_sequence) - window_size + 1), function(i) {
    window <- substr(dna_sequence, i, i + window_size - 1)
    calculate_gc_content(window)
  })
  return(gc_contents)
}

# Path to your FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Loop through each sequence in the FASTA file
for (seq_id in names(sequences)) {
  dna_sequence <- as.character(sequences[[seq_id]])  # Convert DNAString to character string
  print(paste("GC Content for sliding window in sequence:", seq_id))
  result <- sliding_window_gc_content(dna_sequence, 5)  # Example: window size 5
  print(result)
}

