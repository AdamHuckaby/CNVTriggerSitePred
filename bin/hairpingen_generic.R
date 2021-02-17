#Read data in
inputdata <- read.table("input_dataTYPE.txt", quote="\"", comment.char="")

#Create necessary dataframes for bed files
inputdata["V2"] <- NA
inputdata["V3"] <- NA
inputdata["V4"] <- NA
inputdata["V5"] <- NA
inputdata["V6"] <- NA

#Put hairpin data into correct column
inputdata["V5"] <- inputdata$V1

#Give names of chromsomes
inputdata["V1"] <- ("inputTYPE")

#Give Start
inputdata["V2"] <- 1:nrow(inputdata)

#Give End, change based on window size
inputdata["V3"] <- ((inputdata$V2)+49)

#Give feature type
inputdata["V4"] <- ("Hairpin")

#Give strand, currently just a placeholder
inputdata["V6"] <- ("+")

#Write bedfiles
write.table(inputdata, file = "input_dataTYPE.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)