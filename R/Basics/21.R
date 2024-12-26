### Fetch Protein Sequences from UniProt by Accession IDs
library(httr)

accession_ids <- c("P12345", "Q67890")
for (id in accession_ids) {
  url <- paste0("https://www.uniprot.org/uniprot/", id, ".fasta")
  response <- GET(url)
  if (status_code(response) == 200) {
    cat(content(response, "text"), "\n")
  } else {
    cat("Failed to fetch", id, "\n")
  }
}
