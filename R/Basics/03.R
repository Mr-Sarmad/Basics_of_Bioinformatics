### Parse a FASTQ file and calculate the average quality score of each sequence
library(ShortRead)
fasta_file <- "C:/Users/PC/Downloads/Compressed/ERR12051591.fastq/ERR12051591.fastq"
fq <- readFastq(fasta_file)
quals <- quality(fq)
avg_quals <- rowMeans(as(quals, "matrix"))
names(avg_quals) <- id(fq)
avg_quals
