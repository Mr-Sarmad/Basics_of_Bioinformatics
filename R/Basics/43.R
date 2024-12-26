### Parse a HMMER Output File and Extract Significant Hits Based on E-value Threshold

library(data.table)

# Read HMMER output file
hmmer_output <- fread("hmmer_output.txt")

# Filter based on E-value threshold
e_value_threshold <- 1e-5
significant_hits <- hmmer_output[hmmer_output$E_value < e_value_threshold, ]
write.csv(significant_hits, "significant_hits.csv")
