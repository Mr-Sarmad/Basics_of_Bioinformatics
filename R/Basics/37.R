### Parse a phylogenetic tree file (Newick format) and list all leaf node names
library(ape)

list_leaf_nodes <- function(newick_file) {
  tree <- read.tree(newick_file)
  return(tree$tip.label)
}

# Example usage
list_leaf_nodes("C:/Users/PC/Downloads/tree.nwk")
