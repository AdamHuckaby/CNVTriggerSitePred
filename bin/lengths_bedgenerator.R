#Read data in, remove API, MIT, and contigs (contigs may have other names so check in file)
Length_data <- read.delim("lengths.txt", header=F)
Length_data <- Length_data[ grep("API", Length_data$V1, invert = TRUE) , ]
Length_data <- Length_data[ grep("MIT", Length_data$V1, invert = TRUE) , ]
Length_data <- Length_data[ grep("contig", Length_data$V1, invert = TRUE) , ]

#Create necessary dataframes for bed files
input_full <- data.frame(matrix(ncol=6, nrow=14))

#Give names of chromsomes
input_full["X1"] <- Length_data$V1

#Give Start
input_full["X2"] <- 1

#Give End
input_full["X3"] <- Length_data$V2

#Give feature type
input_full["X4"] <- ("Chromosome")

#Give generic value for fifth column
input_full["X5"] <- 0

#Give strand
input_full["X6"] <- ("+")

#Generate bed file with trimmed from ends
input_trimmed <- input_full
input_trimmed["X2"] <- trimsize
input_trimmed["X3"] <- Length_data$V2 - trimsize

#Write bedfiles
write.table(input_full, file = "input_full_lengths.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(input_trimmed, file = "input_trimmed_lengths.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
