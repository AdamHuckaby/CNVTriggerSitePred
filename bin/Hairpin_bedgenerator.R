#read data in
FILENAME_01_shuffle_linear_data <- read.table("FILENAME_01_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_02_shuffle_linear_data <- read.table("FILENAME_02_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_03_shuffle_linear_data <- read.table("FILENAME_03_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_04_shuffle_linear_data <- read.table("FILENAME_04_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_05_shuffle_linear_data <- read.table("FILENAME_05_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_06_shuffle_linear_data <- read.table("FILENAME_06_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_07_shuffle_linear_data <- read.table("FILENAME_07_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_08_shuffle_linear_data <- read.table("FILENAME_08_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_09_shuffle_linear_data <- read.table("FILENAME_09_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_10_shuffle_linear_data <- read.table("FILENAME_10_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_11_shuffle_linear_data <- read.table("FILENAME_11_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_12_shuffle_linear_data <- read.table("FILENAME_12_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_13_shuffle_linear_data <- read.table("FILENAME_13_shuffle_linear_data.txt", quote="\"", comment.char="")
FILENAME_14_shuffle_linear_data <- read.table("FILENAME_14_shuffle_linear_data.txt", quote="\"", comment.char="")

#Create necessary dataframes for bed files
FILENAME_01_shuffle_linear_data["V2"] <- NA
FILENAME_02_shuffle_linear_data["V2"] <- NA
FILENAME_03_shuffle_linear_data["V2"] <- NA
FILENAME_04_shuffle_linear_data["V2"] <- NA
FILENAME_05_shuffle_linear_data["V2"] <- NA
FILENAME_06_shuffle_linear_data["V2"] <- NA
FILENAME_07_shuffle_linear_data["V2"] <- NA
FILENAME_08_shuffle_linear_data["V2"] <- NA
FILENAME_09_shuffle_linear_data["V2"] <- NA
FILENAME_10_shuffle_linear_data["V2"] <- NA
FILENAME_11_shuffle_linear_data["V2"] <- NA
FILENAME_12_shuffle_linear_data["V2"] <- NA
FILENAME_13_shuffle_linear_data["V2"] <- NA
FILENAME_14_shuffle_linear_data["V2"] <- NA
FILENAME_01_shuffle_linear_data["V3"] <- NA
FILENAME_02_shuffle_linear_data["V3"] <- NA
FILENAME_03_shuffle_linear_data["V3"] <- NA
FILENAME_04_shuffle_linear_data["V3"] <- NA
FILENAME_05_shuffle_linear_data["V3"] <- NA
FILENAME_06_shuffle_linear_data["V3"] <- NA
FILENAME_07_shuffle_linear_data["V3"] <- NA
FILENAME_08_shuffle_linear_data["V3"] <- NA
FILENAME_09_shuffle_linear_data["V3"] <- NA
FILENAME_10_shuffle_linear_data["V3"] <- NA
FILENAME_11_shuffle_linear_data["V3"] <- NA
FILENAME_12_shuffle_linear_data["V3"] <- NA
FILENAME_13_shuffle_linear_data["V3"] <- NA
FILENAME_14_shuffle_linear_data["V3"] <- NA
FILENAME_01_shuffle_linear_data["V4"] <- NA
FILENAME_02_shuffle_linear_data["V4"] <- NA
FILENAME_03_shuffle_linear_data["V4"] <- NA
FILENAME_04_shuffle_linear_data["V4"] <- NA
FILENAME_05_shuffle_linear_data["V4"] <- NA
FILENAME_06_shuffle_linear_data["V4"] <- NA
FILENAME_07_shuffle_linear_data["V4"] <- NA
FILENAME_08_shuffle_linear_data["V4"] <- NA
FILENAME_09_shuffle_linear_data["V4"] <- NA
FILENAME_10_shuffle_linear_data["V4"] <- NA
FILENAME_11_shuffle_linear_data["V4"] <- NA
FILENAME_12_shuffle_linear_data["V4"] <- NA
FILENAME_13_shuffle_linear_data["V4"] <- NA
FILENAME_14_shuffle_linear_data["V4"] <- NA
FILENAME_01_shuffle_linear_data["V5"] <- NA
FILENAME_02_shuffle_linear_data["V5"] <- NA
FILENAME_03_shuffle_linear_data["V5"] <- NA
FILENAME_04_shuffle_linear_data["V5"] <- NA
FILENAME_05_shuffle_linear_data["V5"] <- NA
FILENAME_06_shuffle_linear_data["V5"] <- NA
FILENAME_07_shuffle_linear_data["V5"] <- NA
FILENAME_08_shuffle_linear_data["V5"] <- NA
FILENAME_09_shuffle_linear_data["V5"] <- NA
FILENAME_10_shuffle_linear_data["V5"] <- NA
FILENAME_11_shuffle_linear_data["V5"] <- NA
FILENAME_12_shuffle_linear_data["V5"] <- NA
FILENAME_13_shuffle_linear_data["V5"] <- NA
FILENAME_14_shuffle_linear_data["V5"] <- NA
FILENAME_01_shuffle_linear_data["V6"] <- NA
FILENAME_02_shuffle_linear_data["V6"] <- NA
FILENAME_03_shuffle_linear_data["V6"] <- NA
FILENAME_04_shuffle_linear_data["V6"] <- NA
FILENAME_05_shuffle_linear_data["V6"] <- NA
FILENAME_06_shuffle_linear_data["V6"] <- NA
FILENAME_07_shuffle_linear_data["V6"] <- NA
FILENAME_08_shuffle_linear_data["V6"] <- NA
FILENAME_09_shuffle_linear_data["V6"] <- NA
FILENAME_10_shuffle_linear_data["V6"] <- NA
FILENAME_11_shuffle_linear_data["V6"] <- NA
FILENAME_12_shuffle_linear_data["V6"] <- NA
FILENAME_13_shuffle_linear_data["V6"] <- NA
FILENAME_14_shuffle_linear_data["V6"] <- NA

#Put hairpin data into correct column
FILENAME_01_shuffle_linear_data["V5"] <- FILENAME_01_shuffle_linear_data$V1
FILENAME_02_shuffle_linear_data["V5"] <- FILENAME_02_shuffle_linear_data$V1
FILENAME_03_shuffle_linear_data["V5"] <- FILENAME_03_shuffle_linear_data$V1
FILENAME_04_shuffle_linear_data["V5"] <- FILENAME_04_shuffle_linear_data$V1
FILENAME_05_shuffle_linear_data["V5"] <- FILENAME_05_shuffle_linear_data$V1
FILENAME_06_shuffle_linear_data["V5"] <- FILENAME_06_shuffle_linear_data$V1
FILENAME_07_shuffle_linear_data["V5"] <- FILENAME_07_shuffle_linear_data$V1
FILENAME_08_shuffle_linear_data["V5"] <- FILENAME_08_shuffle_linear_data$V1
FILENAME_09_shuffle_linear_data["V5"] <- FILENAME_09_shuffle_linear_data$V1
FILENAME_10_shuffle_linear_data["V5"] <- FILENAME_10_shuffle_linear_data$V1
FILENAME_11_shuffle_linear_data["V5"] <- FILENAME_11_shuffle_linear_data$V1
FILENAME_12_shuffle_linear_data["V5"] <- FILENAME_12_shuffle_linear_data$V1
FILENAME_13_shuffle_linear_data["V5"] <- FILENAME_13_shuffle_linear_data$V1
FILENAME_14_shuffle_linear_data["V5"] <- FILENAME_14_shuffle_linear_data$V1

#Give names of chromsomes
FILENAME_01_shuffle_linear_data["V1"] <- ("FILENAME_01_v1")
FILENAME_02_shuffle_linear_data["V1"] <- ("FILENAME_02_v1")
FILENAME_03_shuffle_linear_data["V1"] <- ("FILENAME_03_v1")
FILENAME_04_shuffle_linear_data["V1"] <- ("FILENAME_04_v1")
FILENAME_05_shuffle_linear_data["V1"] <- ("FILENAME_05_v1")
FILENAME_06_shuffle_linear_data["V1"] <- ("FILENAME_06_v1")
FILENAME_07_shuffle_linear_data["V1"] <- ("FILENAME_07_v1")
FILENAME_08_shuffle_linear_data["V1"] <- ("FILENAME_08_v1")
FILENAME_09_shuffle_linear_data["V1"] <- ("FILENAME_09_v1")
FILENAME_10_shuffle_linear_data["V1"] <- ("FILENAME_10_v1")
FILENAME_11_shuffle_linear_data["V1"] <- ("FILENAME_11_v1")
FILENAME_12_shuffle_linear_data["V1"] <- ("FILENAME_12_v1")
FILENAME_13_shuffle_linear_data["V1"] <- ("FILENAME_13_v1")
FILENAME_14_shuffle_linear_data["V1"] <- ("FILENAME_14_v1")

#Give Start
FILENAME_01_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_01_shuffle_linear_data)
FILENAME_02_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_02_shuffle_linear_data)
FILENAME_03_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_03_shuffle_linear_data)
FILENAME_04_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_04_shuffle_linear_data)
FILENAME_05_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_05_shuffle_linear_data)
FILENAME_06_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_06_shuffle_linear_data)
FILENAME_07_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_07_shuffle_linear_data)
FILENAME_08_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_08_shuffle_linear_data)
FILENAME_09_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_09_shuffle_linear_data)
FILENAME_10_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_10_shuffle_linear_data)
FILENAME_11_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_11_shuffle_linear_data)
FILENAME_12_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_12_shuffle_linear_data)
FILENAME_13_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_13_shuffle_linear_data)
FILENAME_14_shuffle_linear_data["V2"] <- 1:nrow(FILENAME_14_shuffle_linear_data)

#Give End
FILENAME_01_shuffle_linear_data["V3"] <- ((FILENAME_01_shuffle_linear_data$V2)+49)
FILENAME_02_shuffle_linear_data["V3"] <- ((FILENAME_02_shuffle_linear_data$V2)+49)
FILENAME_03_shuffle_linear_data["V3"] <- ((FILENAME_03_shuffle_linear_data$V2)+49)
FILENAME_04_shuffle_linear_data["V3"] <- ((FILENAME_04_shuffle_linear_data$V2)+49)
FILENAME_05_shuffle_linear_data["V3"] <- ((FILENAME_05_shuffle_linear_data$V2)+49)
FILENAME_06_shuffle_linear_data["V3"] <- ((FILENAME_06_shuffle_linear_data$V2)+49)
FILENAME_07_shuffle_linear_data["V3"] <- ((FILENAME_07_shuffle_linear_data$V2)+49)
FILENAME_08_shuffle_linear_data["V3"] <- ((FILENAME_08_shuffle_linear_data$V2)+49)
FILENAME_09_shuffle_linear_data["V3"] <- ((FILENAME_09_shuffle_linear_data$V2)+49)
FILENAME_10_shuffle_linear_data["V3"] <- ((FILENAME_10_shuffle_linear_data$V2)+49)
FILENAME_11_shuffle_linear_data["V3"] <- ((FILENAME_11_shuffle_linear_data$V2)+49)
FILENAME_12_shuffle_linear_data["V3"] <- ((FILENAME_12_shuffle_linear_data$V2)+49)
FILENAME_13_shuffle_linear_data["V3"] <- ((FILENAME_13_shuffle_linear_data$V2)+49)
FILENAME_14_shuffle_linear_data["V3"] <- ((FILENAME_14_shuffle_linear_data$V2)+49)

#Give feature type
FILENAME_01_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_02_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_03_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_04_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_05_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_06_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_07_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_08_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_09_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_10_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_11_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_12_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_13_shuffle_linear_data["V4"] <- ("Hairpin")
FILENAME_14_shuffle_linear_data["V4"] <- ("Hairpin")

#Give strand
FILENAME_01_shuffle_linear_data["V6"] <- ("+")
FILENAME_02_shuffle_linear_data["V6"] <- ("+")
FILENAME_03_shuffle_linear_data["V6"] <- ("+")
FILENAME_04_shuffle_linear_data["V6"] <- ("+")
FILENAME_05_shuffle_linear_data["V6"] <- ("+")
FILENAME_06_shuffle_linear_data["V6"] <- ("+")
FILENAME_07_shuffle_linear_data["V6"] <- ("+")
FILENAME_08_shuffle_linear_data["V6"] <- ("+")
FILENAME_09_shuffle_linear_data["V6"] <- ("+")
FILENAME_10_shuffle_linear_data["V6"] <- ("+")
FILENAME_11_shuffle_linear_data["V6"] <- ("+")
FILENAME_12_shuffle_linear_data["V6"] <- ("+")
FILENAME_13_shuffle_linear_data["V6"] <- ("+")
FILENAME_14_shuffle_linear_data["V6"] <- ("+")

#Create one bedfile
FILENAMEtotal_data <- rbind(FILENAME_01_shuffle_linear_data, FILENAME_02_shuffle_linear_data, FILENAME_03_shuffle_linear_data, FILENAME_04_shuffle_linear_data, FILENAME_05_shuffle_linear_data, FILENAME_06_shuffle_linear_data, FILENAME_07_shuffle_linear_data, FILENAME_08_shuffle_linear_data, FILENAME_09_shuffle_linear_data, FILENAME_10_shuffle_linear_data, FILENAME_11_shuffle_linear_data, FILENAME_12_shuffle_linear_data, FILENAME_13_shuffle_linear_data, FILENAME_14_shuffle_linear_data)

# This is used only if files are not trimmed before running
# FILENAME_01_v1_notelo1 <- subset(FILENAME_01_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_02_v1_notelo1 <- subset(FILENAME_02_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_03_v1_notelo1 <- subset(FILENAME_03_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_04_v1_notelo1 <- subset(FILENAME_04_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_05_v1_notelo1 <- subset(FILENAME_05_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_06_v1_notelo1 <- subset(FILENAME_06_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_07_v1_notelo1 <- subset(FILENAME_07_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_08_v1_notelo1 <- subset(FILENAME_08_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_09_v1_notelo1 <- subset(FILENAME_09_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_10_v1_notelo1 <- subset(FILENAME_10_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_11_v1_notelo1 <- subset(FILENAME_11_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_12_v1_notelo1 <- subset(FILENAME_12_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_13_v1_notelo1 <- subset(FILENAME_13_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_14_v1_notelo1 <- subset(FILENAME_14_shuffle_linear_data, V3 <= (1:nrow(FILENAME_01_shuffle_linear_data)-50000))
# FILENAME_01_v1_notelo2 <- subset(FILENAME_01_notelo1, V3 >= 50000)
# FILENAME_02_v1_notelo2 <- subset(FILENAME_02_notelo1, V3 >= 50000)
# FILENAME_03_v1_notelo2 <- subset(FILENAME_03_notelo1, V3 >= 50000)
# FILENAME_04_v1_notelo2 <- subset(FILENAME_04_notelo1, V3 >= 50000)
# FILENAME_05_v1_notelo2 <- subset(FILENAME_05_notelo1, V3 >= 50000)
# FILENAME_06_v1_notelo2 <- subset(FILENAME_06_notelo1, V3 >= 50000)
# FILENAME_07_v1_notelo2 <- subset(FILENAME_07_notelo1, V3 >= 50000)
# FILENAME_08_v1_notelo2 <- subset(FILENAME_08_notelo1, V3 >= 50000)
# FILENAME_09_v1_notelo2 <- subset(FILENAME_09_notelo1, V3 >= 50000)
# FILENAME_10_v1_notelo2 <- subset(FILENAME_10_notelo1, V3 >= 50000)
# FILENAME_11_v1_notelo2 <- subset(FILENAME_11_notelo1, V3 >= 50000)
# FILENAME_12_v1_notelo2 <- subset(FILENAME_12_notelo1, V3 >= 50000)
# FILENAME_13_v1_notelo2 <- subset(FILENAME_13_notelo1, V3 >= 50000)
# FILENAME_14_v1_notelo2 <- subset(FILENAME_14_notelo1, V3 >= 50000)

#Create one bedfile
FILENAMEtotal_notelo_data <- rbind(FILENAME_01_notelo2, FILENAME_02_notelo2, FILENAME_03_notelo2, FILENAME_04_notelo2, FILENAME_05_notelo2, FILENAME_06_notelo2, FILENAME_07_notelo2, FILENAME_08_notelo2, FILENAME_09_notelo2, FILENAME_10_notelo2, FILENAME_11_notelo2, FILENAME_12_notelo2, FILENAME_13_notelo2, FILENAME_14_notelo2)

#Write bedfiles
write.table(FILENAME_01_shuffle_linear_data, file = "FILENAME_01_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_02_shuffle_linear_data, file = "FILENAME_02_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_03_shuffle_linear_data, file = "FILENAME_03_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_04_shuffle_linear_data, file = "FILENAME_04_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_05_shuffle_linear_data, file = "FILENAME_05_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_06_shuffle_linear_data, file = "FILENAME_06_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_07_shuffle_linear_data, file = "FILENAME_07_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_08_shuffle_linear_data, file = "FILENAME_08_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_09_shuffle_linear_data, file = "FILENAME_09_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_10_shuffle_linear_data, file = "FILENAME_10_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_11_shuffle_linear_data, file = "FILENAME_11_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_12_shuffle_linear_data, file = "FILENAME_12_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_13_shuffle_linear_data, file = "FILENAME_13_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAME_14_shuffle_linear_data, file = "FILENAME_14_shuffle_linear_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAMEtotal_data, file = "FILENAMEtotal_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)
write.table(FILENAMEtotal_notelo_data, file = "FILENAMEtotal_notelo_data.bed", quote=FALSE, sep='\t', col.names=FALSE, row.names=FALSE)