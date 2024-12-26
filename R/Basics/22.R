### Retrieve Nucleotide Sequences from NCBI Entrez for Gene IDs
library(rentrez)

entrez_email <- "sarmadgill20@gmail.com"
gene_ids <- c("NM_000546", "NC_000001")
for (id in gene_ids) {
  seq <- entrez_fetch(db="nucleotide", id=id, rettype="fasta", retmode="text", email=entrez_email)
  cat(seq, "\n")
}
