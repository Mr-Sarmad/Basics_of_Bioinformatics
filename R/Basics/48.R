### Perform Codon Optimization for a Given DNA Sequence

library(Biostrings)

# Input DNA sequence
dna_sequence <- DNAString("ATGACCTGAGTACGTAAG")

# Codon usage table (example for optimization)
codon_usage <- c("ATG" = "ATG", "ACC" = "GCC", "GAG" = "GAG", "TAC" = "TAT", "GTA" = "GTG", "AAG" = "AAA")

# Codon optimization
optimized_sequence <- sapply(seq(1, nchar(dna_sequence), by = 3), function(pos) {
  codon <- substr(dna_sequence, pos, pos + 2)
  ifelse(codon %in% names(codon_usage), codon_usage[codon], codon)
})
optimized_sequence <- paste(optimized_sequence, collapse = "")

print(optimized_sequence)
