### Pipeline to Run BLAST on Multiple Input Sequences and Summarize Results

# Define input sequence files
input_files <- c("seq1.fasta", "seq2.fasta", "seq3.fasta")

# Loop to run BLAST for each file
for (file in input_files) {
  output_file <- sub("\\.fasta$", "_blast.txt", file)
  command <- paste("blastn -query", file, "-db nt -out", output_file, "-evalue 0.001 -outfmt 6")
  system(command)
}

# Summarize BLAST results
summarize_blast_results <- function(output_files) {
  results <- lapply(output_files, function(file) {
    read.table(file, header = FALSE, sep = "\t")
  })
  do.call(rbind, results)
}

blast_output_files <- sub("\\.fasta$", "_blast.txt", input_files)
summarized_results <- summarize_blast_results(blast_output_files)
write.csv(summarized_results, "blast_results_summary.csv")
