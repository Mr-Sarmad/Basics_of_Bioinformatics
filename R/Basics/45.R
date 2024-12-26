### Analyze a Multiple Sequence Alignment (MSA) File to Calculate Conservation Scores

library(seqinr)

# Read MSA file
msa <- read.alignment("alignment.fasta", format = "fasta")

# Calculate conservation scores
conservation_scores <- apply(as.matrix(msa), 2, function(column) {
  unique_bases <- unique(column)
  length(unique_bases) / length(column)
})

# Output conservation scores
write.csv(conservation_scores, "conservation_scores.csv")
