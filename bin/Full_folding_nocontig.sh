# #This script is simply parallelized using bash for longer steps, change to gnu parallel later for better usage
# #Also need to make path independent and update for file names so it runs on any genome/fasta input file
# #Create windower for each chromosome s= substitute, g = global and not just first occurrence
# sed 's/FILENAME/PvP01_01_v1/g' windower_generic.py > windower_PvP01_1.py
# sed 's/FILENAME/PvP01_02_v1/g' windower_generic.py > windower_PvP01_2.py
# sed 's/FILENAME/PvP01_03_v1/g' windower_generic.py > windower_PvP01_3.py
# sed 's/FILENAME/PvP01_04_v1/g' windower_generic.py > windower_PvP01_4.py
# sed 's/FILENAME/PvP01_05_v1/g' windower_generic.py > windower_PvP01_5.py
# sed 's/FILENAME/PvP01_06_v1/g' windower_generic.py > windower_PvP01_6.py
# sed 's/FILENAME/PvP01_07_v1/g' windower_generic.py > windower_PvP01_7.py
# sed 's/FILENAME/PvP01_08_v1/g' windower_generic.py > windower_PvP01_8.py
# sed 's/FILENAME/PvP01_09_v1/g' windower_generic.py > windower_PvP01_9.py
# sed 's/FILENAME/PvP01_10_v1/g' windower_generic.py > windower_PvP01_10.py
# sed 's/FILENAME/PvP01_11_v1/g' windower_generic.py > windower_PvP01_11.py
# sed 's/FILENAME/PvP01_12_v1/g' windower_generic.py > windower_PvP01_12.py
# sed 's/FILENAME/PvP01_13_v1/g' windower_generic.py > windower_PvP01_13.py
# sed 's/FILENAME/PvP01_14_v1/g' windower_generic.py > windower_PvP01_14.py

# #Generate windows for each chromosome
# #Change number of "&" lines before "wait" lines to match how many cores you want used 
# python windower_PvP01_1.py &
# python windower_PvP01_2.py &
# python windower_PvP01_3.py &
# python windower_PvP01_4.py &
# python windower_PvP01_5.py &
# python windower_PvP01_6.py &
# python windower_PvP01_7.py &
# python windower_PvP01_8.py &
# wait
# python windower_PvP01_9.py &
# python windower_PvP01_10.py &
# python windower_PvP01_11.py &
# python windower_PvP01_12.py &
# python windower_PvP01_13.py &
# python windower_PvP01_14.py &
# wait

# #Clean up temp files
# rm *PvP01*.py

# #Fold after the win have been generated
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_01_v1_win.txt > PvP01_01_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_02_v1_win.txt > PvP01_02_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_03_v1_win.txt > PvP01_03_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_04_v1_win.txt > PvP01_04_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_05_v1_win.txt > PvP01_05_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_06_v1_win.txt > PvP01_06_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_07_v1_win.txt > PvP01_07_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_08_v1_win.txt > PvP01_08_v1_hairpins.txt &
# wait
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_09_v1_win.txt > PvP01_09_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_10_v1_win.txt > PvP01_10_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_11_v1_win.txt > PvP01_11_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_12_v1_win.txt > PvP01_12_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_13_v1_win.txt > PvP01_13_v1_hairpins.txt &
# RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_14_v1_win.txt > PvP01_14_v1_hairpins.txt &
# wait

# #Create the data files with only deltaG
# sed -n '3~3p' < PvP01_01_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_01_v1_data.txt
# sed -n '3~3p' < PvP01_02_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_02_v1_data.txt
# sed -n '3~3p' < PvP01_03_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_03_v1_data.txt
# sed -n '3~3p' < PvP01_04_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_04_v1_data.txt
# sed -n '3~3p' < PvP01_05_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_05_v1_data.txt
# sed -n '3~3p' < PvP01_06_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_06_v1_data.txt
# sed -n '3~3p' < PvP01_07_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_07_v1_data.txt
# sed -n '3~3p' < PvP01_08_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_08_v1_data.txt
# sed -n '3~3p' < PvP01_09_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_09_v1_data.txt
# sed -n '3~3p' < PvP01_10_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_10_v1_data.txt
# sed -n '3~3p' < PvP01_11_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_11_v1_data.txt
# sed -n '3~3p' < PvP01_12_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_12_v1_data.txt
# sed -n '3~3p' < PvP01_13_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_13_v1_data.txt
# sed -n '3~3p' < PvP01_14_v1_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_14_v1_data.txt

# #Move files to correct folders
# #mv *hairpins.txt hairpins
# #mv *win.txt windows
# #mv *v1.fasta sequences

#Create bed files of data, make sure you edit the R script with names of input/output --> work on automating further in the future
Rscript PvP01_hairpin_bedgenerator.R

#Get lengths of contigs, write lengths as bed file, write bed file with 50kb removed from ends of chromosome, work on automating the trimming aspect
grep -o '^\S*' < PlasmoDB-39_PvivaxP01_Genome.fasta > temp_fasta.txt
cat temp_fasta.txt| awk '$0 ~ ">" {print c; c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' > lengths.txt
sed -i '1d' lengths.txt
Rscript lengths_bedgenerator.R
bedtools intersect -u -a PvP01_01_v1_data.bed -b PvP01_50kb.bed > PvP01_01_v1_notelo.bed
bedtools intersect -u -a PvP01_02_v1_data.bed -b PvP01_50kb.bed > PvP01_02_v1_notelo.bed
bedtools intersect -u -a PvP01_03_v1_data.bed -b PvP01_50kb.bed > PvP01_03_v1_notelo.bed
bedtools intersect -u -a PvP01_04_v1_data.bed -b PvP01_50kb.bed > PvP01_04_v1_notelo.bed
bedtools intersect -u -a PvP01_05_v1_data.bed -b PvP01_50kb.bed > PvP01_05_v1_notelo.bed
bedtools intersect -u -a PvP01_06_v1_data.bed -b PvP01_50kb.bed > PvP01_06_v1_notelo.bed
bedtools intersect -u -a PvP01_07_v1_data.bed -b PvP01_50kb.bed > PvP01_07_v1_notelo.bed
bedtools intersect -u -a PvP01_08_v1_data.bed -b PvP01_50kb.bed > PvP01_08_v1_notelo.bed
bedtools intersect -u -a PvP01_09_v1_data.bed -b PvP01_50kb.bed > PvP01_09_v1_notelo.bed
bedtools intersect -u -a PvP01_10_v1_data.bed -b PvP01_50kb.bed > PvP01_10_v1_notelo.bed
bedtools intersect -u -a PvP01_11_v1_data.bed -b PvP01_50kb.bed > PvP01_11_v1_notelo.bed
bedtools intersect -u -a PvP01_12_v1_data.bed -b PvP01_50kb.bed > PvP01_12_v1_notelo.bed
bedtools intersect -u -a PvP01_13_v1_data.bed -b PvP01_50kb.bed > PvP01_13_v1_notelo.bed
bedtools intersect -u -a PvP01_14_v1_data.bed -b PvP01_50kb.bed > PvP01_14_v1_notelo.bed

#Create quantile/subset script for each chromosome
sed 's/FILENAME/PvP01_01_v1/g' subset_generic.R > subset_PvP01_1.R
sed 's/FILENAME/PvP01_02_v1/g' subset_generic.R > subset_PvP01_2.R
sed 's/FILENAME/PvP01_03_v1/g' subset_generic.R > subset_PvP01_3.R
sed 's/FILENAME/PvP01_04_v1/g' subset_generic.R > subset_PvP01_4.R
sed 's/FILENAME/PvP01_05_v1/g' subset_generic.R > subset_PvP01_5.R
sed 's/FILENAME/PvP01_06_v1/g' subset_generic.R > subset_PvP01_6.R
sed 's/FILENAME/PvP01_07_v1/g' subset_generic.R > subset_PvP01_7.R
sed 's/FILENAME/PvP01_08_v1/g' subset_generic.R > subset_PvP01_8.R
sed 's/FILENAME/PvP01_09_v1/g' subset_generic.R > subset_PvP01_9.R
sed 's/FILENAME/PvP01_10_v1/g' subset_generic.R > subset_PvP01_10.R
sed 's/FILENAME/PvP01_11_v1/g' subset_generic.R > subset_PvP01_11.R
sed 's/FILENAME/PvP01_12_v1/g' subset_generic.R > subset_PvP01_12.R
sed 's/FILENAME/PvP01_13_v1/g' subset_generic.R > subset_PvP01_13.R
sed 's/FILENAME/PvP01_14_v1/g' subset_generic.R > subset_PvP01_14.R

#Subset each one
Rscript subset_PvP01_1.R
Rscript subset_PvP01_2.R
Rscript subset_PvP01_3.R
Rscript subset_PvP01_4.R
Rscript subset_PvP01_5.R
Rscript subset_PvP01_6.R
Rscript subset_PvP01_7.R
Rscript subset_PvP01_8.R
Rscript subset_PvP01_9.R
Rscript subset_PvP01_10.R
Rscript subset_PvP01_11.R
Rscript subset_PvP01_12.R
Rscript subset_PvP01_13.R
Rscript subset_PvP01_14.R

#Clean up temp files
rm *PvP01*.R

#Create minima script for each chromosome, use subsetted hairpins (try with unsubsetted)
sed 's/FILENAME/PvP01_01_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_1.R
sed 's/FILENAME/PvP01_02_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_2.R
sed 's/FILENAME/PvP01_03_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_3.R
sed 's/FILENAME/PvP01_04_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_4.R
sed 's/FILENAME/PvP01_05_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_5.R
sed 's/FILENAME/PvP01_06_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_6.R
sed 's/FILENAME/PvP01_07_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_7.R
sed 's/FILENAME/PvP01_08_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_8.R
sed 's/FILENAME/PvP01_09_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_9.R
sed 's/FILENAME/PvP01_10_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_10.R
sed 's/FILENAME/PvP01_11_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_11.R
sed 's/FILENAME/PvP01_12_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_12.R
sed 's/FILENAME/PvP01_13_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_13.R
sed 's/FILENAME/PvP01_14_v1/g' local_minima_fixed_generic.R > local_minima_PvP01_14.R

#Generate minima
Rscript local_minima_PvP01_1.R
Rscript local_minima_PvP01_2.R
Rscript local_minima_PvP01_3.R
Rscript local_minima_PvP01_4.R
Rscript local_minima_PvP01_5.R
Rscript local_minima_PvP01_6.R
Rscript local_minima_PvP01_7.R
Rscript local_minima_PvP01_8.R
Rscript local_minima_PvP01_9.R
Rscript local_minima_PvP01_10.R
Rscript local_minima_PvP01_11.R
Rscript local_minima_PvP01_12.R
Rscript local_minima_PvP01_13.R
Rscript local_minima_PvP01_14.R

#Clean up temp files
rm *PvP01*.R

#Create collapse minima file for each chromosome
sed 's/FILENAME/PvP01_01_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_1.R
sed 's/FILENAME/PvP01_02_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_2.R
sed 's/FILENAME/PvP01_03_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_3.R
sed 's/FILENAME/PvP01_04_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_4.R
sed 's/FILENAME/PvP01_05_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_5.R
sed 's/FILENAME/PvP01_06_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_6.R
sed 's/FILENAME/PvP01_07_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_7.R
sed 's/FILENAME/PvP01_08_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_8.R
sed 's/FILENAME/PvP01_09_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_9.R
sed 's/FILENAME/PvP01_10_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_10.R
sed 's/FILENAME/PvP01_11_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_11.R
sed 's/FILENAME/PvP01_12_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_12.R
sed 's/FILENAME/PvP01_13_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_13.R
sed 's/FILENAME/PvP01_14_v1/g' contig_collapse_fixgeneric.R > contig_collapse_PvP01_14.R

#Collapse minima
Rscript contig_collapse_PvP01_1.R
Rscript contig_collapse_PvP01_2.R
Rscript contig_collapse_PvP01_3.R
Rscript contig_collapse_PvP01_4.R
Rscript contig_collapse_PvP01_5.R
Rscript contig_collapse_PvP01_6.R
Rscript contig_collapse_PvP01_7.R
Rscript contig_collapse_PvP01_8.R
Rscript contig_collapse_PvP01_9.R
Rscript contig_collapse_PvP01_10.R
Rscript contig_collapse_PvP01_11.R
Rscript contig_collapse_PvP01_12.R
Rscript contig_collapse_PvP01_13.R
Rscript contig_collapse_PvP01_14.R

#Clean up temp files
rm *PvP01*.R

#Concatenate collapsed minima for final final
cat PvP01_01_v1_collapsed.bed PvP01_02_v1_collapsed.bed PvP01_03_v1_collapsed.bed PvP01_04_v1_collapsed.bed PvP01_05_v1_collapsed.bed PvP01_06_v1_collapsed.bed PvP01_07_v1_collapsed.bed PvP01_08_v1_collapsed.bed PvP01_09_v1_collapsed.bed PvP01_10_v1_collapsed.bed PvP01_11_v1_collapsed.bed PvP01_12_v1_collapsed.bed PvP01_13_v1_collapsed.bed PvP01_14_v1_collapsed.bed > PvP01_total_collapsed.bed 