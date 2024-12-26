### Identify Syntenic Regions Between Two Genome Assemblies

library(GenomicRanges)

# Load two genome assemblies (BED-like format)
assembly1 <- read.table("assembly1.bed", header = FALSE)
assembly2 <- read.table("assembly2.bed", header = FALSE)

# Create GRanges objects
gr1 <- GRanges(seqnames = assembly1$V1, ranges = IRanges(start = assembly1$V2, end = assembly1$V3))
gr2 <- GRanges(seqnames = assembly2$V1, ranges = IRanges(start = assembly2$V2, end = assembly2$V3))

# Find overlapping regions
syntenic_regions <- findOverlaps(gr1, gr2)
write.csv(as.data.frame(syntenic_regions), "syntenic_regions.csv")
