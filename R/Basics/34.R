library(Biostrings)

# Function to find palindromic sequences in a DNA sequence
find_palindromes <- function(dna_sequence, min_length = 4) {
  palindromes <- c()  # Empty vector to store palindromes
  dna_length <- nchar(dna_sequence)
  
  # Loop through all possible starting points of the sequence
  for (i in 1:(dna_length - min_length + 1)) {
    for (j in (i + min_length - 1):dna_length) {
      segment <- substr(dna_sequence, i, j)
      
      # Check if the segment is palindromic
      if (segment == paste(rev(strsplit(segment, NULL)[[1]]), collapse = "")) {
        palindromes <- c(palindromes, segment)
      }
    }
  }
  return(unique(palindromes))  # Return unique palindromic sequences
}

# Path to your FASTA file
fasta_file <- "C:/Users/PC/Downloads/sequence (3).fasta"

# Read the sequences from the FASTA file
sequences <- readDNAStringSet(fasta_file)

# Loop through each sequence in the FASTA file
for (seq_id in names(sequences)) {
  dna_sequence <- as.character(sequences[[seq_id]])  # Convert DNAString to character string
  
  # Find palindromic sequences and print them
  palindromes <- find_palindromes(dna_sequence, min_length = 4)
  cat(sprintf("Palindromic sequences for %s:\n", seq_id))
  print(palindromes)
}
