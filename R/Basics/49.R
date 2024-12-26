###  Parse a PDB File to Extract Secondary Structure Information

library(bio3d)

# Read PDB file
pdb <- read.pdb("protein.pdb")

# Extract secondary structure
secondary_structure <- pdb$secondary

# Save to a file
write.csv(secondary_structure, "secondary_structure.csv")

