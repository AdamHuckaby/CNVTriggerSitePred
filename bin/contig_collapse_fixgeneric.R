file = read.delim("input_minima.bed", as.is=T, stringsAsFactors = F, header=F)

new_table = data.frame(stringsAsFactors = F)
for (contig in (unique(file$V4))){
  #print(name)
  x = subset(file, V4 == contig)
  
  chrom = unique(x$V1)
  min = min(x$V2)
  max = max(x$V3)
  delta_g = unique(x$V5)
  strand = unique(x$V6)
  #new_table = rbind(new_table, c(chrom,min,max,contig,delta_g,strand))
  insert = nrow(new_table)+1
  new_table[insert,1] = chrom
  new_table[insert,2] = min
  new_table[insert,3] = max
  new_table[insert,4] = contig
  new_table[insert,5] = delta_g
  new_table[insert,6] = strand
}
colnames(new_table) = c("chrom","min","max","contig","delta_g","strand")
write.table(new_table, "input_collapsed.bed", quote = F, row.names = F, col.names = F, sep = "\t")