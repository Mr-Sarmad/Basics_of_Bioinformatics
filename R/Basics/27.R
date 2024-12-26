### Extract SNP Data from a VCF File
library(R.utils)

vcf_file <- "C:/Users/PC/Downloads/downloaded_file.vcf.gz"
decompressed_file <- sub(".gz$", "", vcf_file)

# Decompress the file
gunzip(vcf_file, decompressed_file, overwrite = TRUE)

# Read the decompressed file
df <- read.delim(decompressed_file, comment.char = "#", header = FALSE)

# Assign column names
colnames(df)[1:8] <- c("CHROM", "POS", "ID", "REF", "ALT", "QUAL", "FILTER", "INFO")

# Extract SNP data
snp_data <- df[, c("CHROM", "POS", "REF", "ALT")]

# Print SNP data
print(snp_data)

