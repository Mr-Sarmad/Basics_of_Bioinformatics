### Calculate Ka/Ks ratios from codon-aligned sequences
#This is complex and typically requires external tools like PAML or HyPhy. Python and R can serve as wrappers to these tools.
library(Biostrings)

# Function to calculate Ka/Ks ratio from codon-aligned sequences
calculate_kaks <- function(alignment) {
  synonymous <- 0
  non_synonymous <- 0
  total_sites <- 0
  
  # Loop through each codon (group of 3 nucleotides) in the alignment
  alignment_length <- nchar(alignment[[1]])  # Assuming all sequences are of equal length
  for (col in seq(1, alignment_length, by = 3)) {
    # Extract codons for each sequence (3 nucleotides)
    codons <- sapply(alignment, function(seq) substr(seq, col, col + 2))
    
    # Skip columns with incomplete codons
    if (any(nchar(codons) != 3)) next  # Ensure all codons have length 3
    
    # Remove gaps ('-') from the codons
    codons <- codons[!grepl("-", codons)]
    
    if (length(codons) < 2) next  # If not enough data for comparison
    
    # Compare pairs of codons
    for (i in 1:(length(codons) - 1)) {
      for (j in (i + 1):length(codons)) {
        codon1 <- codons[i]
        codon2 <- codons[j]
        
        if (is_synonymous(codon1, codon2)) {
          synonymous <- synonymous + 1
        } else {
          non_synonymous <- non_synonymous + 1
        }
        total_sites <- total_sites + 1
      }
    }
  }
  
  # Calculate Ka/Ks ratio
  if (synonymous == 0) return(NA)  # Avoid division by zero
  Ka_Ks_ratio <- non_synonymous / synonymous
  
  return(Ka_Ks_ratio)
}

# Function to check if two codons are synonymous (same amino acid)
is_synonymous <- function(codon1, codon2) {
  # Translate the codons into amino acids
  aa1 <- translate(DNAString(codon1))
  aa2 <- translate(DNAString(codon2))
  
  # Return TRUE if they are synonymous (same amino acid)
  return(aa1 == aa2)
}

# Load codon-aligned sequences from a FASTA file
alignment_file <- "C:/Users/PC/Downloads/sequence (3).fasta"
alignment <- readDNAStringSet(alignment_file)

# Convert the alignment to a matrix (or list) format for easier manipulation
alignment <- lapply(alignment, as.character)

# Calculate the Ka/Ks ratio
kaks <- calculate_kaks(alignment)
cat(sprintf("Ka/Ks Ratio: %.3f\n", kaks))
