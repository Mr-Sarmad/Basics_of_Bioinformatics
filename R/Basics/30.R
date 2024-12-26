### Retrieve Exon Coordinates Using Ensembl API
library(httr)
library(jsonlite)

gene_id <- "ENSG00000139618"
url <- paste0("https://rest.ensembl.org/lookup/id/", gene_id, "?expand=1")

# Perform the GET request
response <- GET(url, add_headers("Content-Type" = "application/json"))

if (status_code(response) == 200) {
  # Parse the JSON response
  data <- fromJSON(content(response, "text", encoding = "UTF-8"))
  
  # Inspect the structure of the data
  str(data)
  
  # Access and print exon information
  if (!is.null(data$Exon)) {
    exon_data <- data$Exon
    print(exon_data)
  } else {
    cat("No exon data available for gene ID:", gene_id, "\n")
  }
} else {
  cat("Failed to retrieve data. Status code:", status_code(response), "\n")
  cat("Error message:", content(response, "text", encoding = "UTF-8"), "\n")
}

