### Batch Download PDB Files
pdb_ids <- c("1A2B", "3C4D")
for (id in pdb_ids) {
  url <- paste0("https://files.rcsb.org/download/", id, ".pdb")
  download.file(url, destfile = paste0(id, ".pdb"))
}
