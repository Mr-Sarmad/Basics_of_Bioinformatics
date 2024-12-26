### Simulate Sequence Evolution Under a Substitution Model

library(phangorn)

# Load alignment and create phylogenetic tree
alignment <- read.phyDat("alignment.phy", format = "phylip")
tree <- nj(dist.ml(alignment))

# Simulate sequence evolution under JC69 model
evolved_sequences <- simSeq(tree, l = 100, model = "JC69")

# Save simulated sequences
write.phyDat(evolved_sequences, "simulated_sequences.phy", format = "phylip")
