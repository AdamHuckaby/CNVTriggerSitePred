############
#take a chromosome file, make windows for each contig of WINDOW_SIZE
############

##import sys and use sys.argv for variable input, convert to int
##run terminal command in python, sys or other

#Get working directory and set relative path to fasta files, read file into list, as "chrom"
chrom = open('input.fasta','r')
outfile = open("input_win.txt","w")

#for each line in chrom, if first character is ">" designate the contig number
for linenum,line in enumerate(chrom,1):
    if line[0] == ">":
        sequence_line = linenum +1

    if linenum == sequence_line:
        for i in range(len(line)-winsize):
            window = line[i:i+winsize]
            outfile.write(">"+"Chromosome_"+"WindowNum_"+str(i+1)+"\n")
            outfile.write(window)
            outfile.write("\n")
        
chrom.close()
outfile.close()
