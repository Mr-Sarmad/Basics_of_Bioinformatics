### Retrieve Taxonomy Information
library(httr)
library(httr)
library(jsonlite)

# Example valid Ensembl IDs
gene_ids <- c("ENSG00000139618", "ENSG00000157764")

for (id in gene_ids) {
  url <- paste0("https://rest.ensembl.org/xrefs/id/", id, "?content-type=application/json")
  response <- GET(url)
  if (status_code(response) == 200) {
    data <- fromJSON(content(response, "text", encoding = "UTF-8"))
    go_terms <- data[data$db_display_name == "GO", "primary_id", drop = FALSE]
    cat("GO terms for", id, ":\n")
    print(go_terms)
  } else if (status_code(response) == 404) {
    cat("ID not found in Ensembl database:", id, "\n")
  } else {
    cat("Failed to retrieve data for", id, ". Status code:", status_code(response), "\n")
  }
}
