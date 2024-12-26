### Extract Functional Annotations from KEGG
library(httr)

pathway_id <- "hsa00010"
url <- paste0("https://rest.kegg.jp/get/", pathway_id)
response <- GET(url)
cat(content(response, "text"))
