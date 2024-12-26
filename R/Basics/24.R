###  Parse BLAST Output to Extract Top Hits
library(dplyr)

blast_file <- "C:/Users/PC/Downloads/sequence_report.tsv"

# Check if file exists
if (!file.exists(blast_file)) {
  stop("File not found: ", blast_file)
}

# Load the data
df <- read.delim(blast_file, header = FALSE)

# Assign column names
colnames(df) <- c("query", "subject", "identity", "alignment_length", "mismatches", "gaps", 
                  "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")

# Inspect data (optional)
print(head(df))

# Extract top hits
top_hits <- df %>% 
  group_by(query) %>% 
  slice_min(evalue, with_ties = FALSE)  # Avoid ties if not desired

# Output results
print(top_hits)
