### Retrieve GO Terms Associated with Gene IDs
library(httr)
library(jsonlite)

gene_ids <- c("ENSG00000139618", "ENSG00000157764")

for (id in gene_ids) {
  url <- paste0("https://rest.ensembl.org/xrefs/id/", id, "?content-type=application/json")
  response <- GET(url)
  if (status_code(response) == 200) {
    data <- fromJSON(content(response, "text", encoding = "UTF-8"))
    
    # Debugging: Print structure and content of data
    if (length(data) == 0) {
      cat("No data returned for ID:", id, "\n")
    } else {
      print(data)
      if ("db_display_name" %in% names(data)) {
        go_terms <- data[data$db_display_name == "GO", "primary_id", drop = FALSE]
        if (nrow(go_terms) > 0) {
          cat("GO terms for", id, ":\n")
          print(go_terms)
        } else {
          cat("No GO terms found for ID:", id, "\n")
        }
      } else {
        cat("'db_display_name' field not found in data for ID:", id, "\n")
      }
    }
  } else {
    cat("Failed to fetch data for ID:", id, ". Status code:", status_code(response), "\n")
  }
  Sys.sleep(1)
}

