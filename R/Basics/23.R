### Download Genome Assemblies Using wget or curl
urls <- c("ftp://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz")
for (url in urls) {
  download.file(url, destfile = basename(url))
}
