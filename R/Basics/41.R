### Extract and visualize coverage depth from a BAM file
library(Rsamtools)

plot_coverage <- function(bam_file, region = NULL) {
  bam <- BamFile(bam_file)
  coverage <- if (is.null(region)) {
    coverage(bam)
  } else {
    coverage(bam, param = ScanBamParam(which = region))
  }
  
  coverage_depth <- as.numeric(coverage)
  plot(coverage_depth, type = "l", col = "blue", xlab = "Position", ylab = "Coverage Depth", main = "Coverage Depth Plot")
}

# Example usage
# plot_coverage("example.bam")
