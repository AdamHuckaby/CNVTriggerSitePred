#Read data in
  input_MonoRepeats_raw <- input_MonoRepeats <- read.csv("input_MonoRepeats.csv")

#Reorder columns and subset for data
  input_MonoRepeats <-input_MonoRepeats[,c(1, 3, 4, 6, 5)]
  
#Create extra column for strand
  input_MonoRepeats["Strand"] <- ("+")

#Clean data to remove csv characters
  input_MonoRepeats$Minimum <- as.numeric(gsub(",","",input_MonoRepeats$Minimum))
  input_MonoRepeats$Maximum <- as.numeric(gsub(",","",input_MonoRepeats$Maximum))

#Create separate files for A/T repeats and G/C repeats
  input_MonoRepeats_AT <- subset(input_MonoRepeats, Repeat.Unit == "A")
  input_MonoRepeats_GC <- subset(input_MonoRepeats, Repeat.Unit == "C")

#Write bedfiles
  write.table(input_MonoRepeats, file = "input_monorepeats_full.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
  write.table(input_MonoRepeats_AT, file = "input_ATtracks_full.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
  write.table(input_MonoRepeats_GC, file = "input_GCtracks_full.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)