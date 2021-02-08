#Generate sequences with no telomeres for shuffling
bedtools getfasta -fi PvP01_01_v1.fasta -bed PvP01_50kb.bed > PvP01_01_v1_notelo.fasta
bedtools getfasta -fi PvP01_02_v1.fasta -bed PvP01_50kb.bed > PvP01_02_v1_notelo.fasta
bedtools getfasta -fi PvP01_03_v1.fasta -bed PvP01_50kb.bed > PvP01_03_v1_notelo.fasta
bedtools getfasta -fi PvP01_04_v1.fasta -bed PvP01_50kb.bed > PvP01_04_v1_notelo.fasta
bedtools getfasta -fi PvP01_05_v1.fasta -bed PvP01_50kb.bed > PvP01_05_v1_notelo.fasta
bedtools getfasta -fi PvP01_06_v1.fasta -bed PvP01_50kb.bed > PvP01_06_v1_notelo.fasta
bedtools getfasta -fi PvP01_07_v1.fasta -bed PvP01_50kb.bed > PvP01_07_v1_notelo.fasta
bedtools getfasta -fi PvP01_08_v1.fasta -bed PvP01_50kb.bed > PvP01_08_v1_notelo.fasta
bedtools getfasta -fi PvP01_09_v1.fasta -bed PvP01_50kb.bed > PvP01_09_v1_notelo.fasta
bedtools getfasta -fi PvP01_10_v1.fasta -bed PvP01_50kb.bed > PvP01_10_v1_notelo.fasta
bedtools getfasta -fi PvP01_11_v1.fasta -bed PvP01_50kb.bed > PvP01_11_v1_notelo.fasta
bedtools getfasta -fi PvP01_12_v1.fasta -bed PvP01_50kb.bed > PvP01_12_v1_notelo.fasta
bedtools getfasta -fi PvP01_13_v1.fasta -bed PvP01_50kb.bed > PvP01_13_v1_notelo.fasta
bedtools getfasta -fi PvP01_14_v1.fasta -bed PvP01_50kb.bed > PvP01_14_v1_notelo.fasta

#Shuffle sequences without telomeres using EMBOSS shuffle seq to determine cutoff, save as _shuffled
#Trim data to be one line for windowing script
sed -e 's/\(^>.*$\)/#\1#/' PvP01_01_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_01_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_02_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_02_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_03_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_03_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_04_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_04_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_05_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_05_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_06_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_06_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_07_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_07_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_08_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_08_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_09_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_09_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_10_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_10_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_11_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_11_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_12_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_12_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_13_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_13_v1_notelo_shuffled2.fasta
sed -e 's/\(^>.*$\)/#\1#/' PvP01_14_v1_notelo_shuffled.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > PvP01_14_v1_notelo_shuffled2.fasta

#Create windower for each chromosome s= substitute, g = global and not just first occurrence
sed 's/FILENAME/PvP01_01_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_1.py
sed 's/FILENAME/PvP01_02_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_2.py
sed 's/FILENAME/PvP01_03_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_3.py
sed 's/FILENAME/PvP01_04_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_4.py
sed 's/FILENAME/PvP01_05_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_5.py
sed 's/FILENAME/PvP01_06_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_6.py
sed 's/FILENAME/PvP01_07_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_7.py
sed 's/FILENAME/PvP01_08_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_8.py
sed 's/FILENAME/PvP01_09_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_9.py
sed 's/FILENAME/PvP01_10_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_10.py
sed 's/FILENAME/PvP01_11_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_11.py
sed 's/FILENAME/PvP01_12_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_12.py
sed 's/FILENAME/PvP01_13_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_13.py
sed 's/FILENAME/PvP01_14_v1_notelo_shuffled2/g' windower_generic.py > windower_PvP01_14.py

#Generate windows for each chromosome
#Change number of "&" lines before "wait" lines to match how many cores you want used 
python windower_PvP01_1.py &
python windower_PvP01_2.py &
python windower_PvP01_3.py &
python windower_PvP01_4.py &
python windower_PvP01_5.py &
python windower_PvP01_6.py &
python windower_PvP01_7.py &
python windower_PvP01_8.py &
wait
python windower_PvP01_9.py &
python windower_PvP01_10.py &
python windower_PvP01_11.py &
python windower_PvP01_12.py &
python windower_PvP01_13.py &
python windower_PvP01_14.py &
wait

#Clean up temp files
rm *PvP01*.py

#Fold with DNA parameters, no conversion of T to U and no hanging ends
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_01_v1_notelo_shuffled2_win.txt > PvP01_01_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_02_v1_notelo_shuffled2_win.txt > PvP01_02_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_03_v1_notelo_shuffled2_win.txt > PvP01_03_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_04_v1_notelo_shuffled2_win.txt > PvP01_04_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_05_v1_notelo_shuffled2_win.txt > PvP01_05_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_06_v1_notelo_shuffled2_win.txt > PvP01_06_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_07_v1_notelo_shuffled2_win.txt > PvP01_07_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_08_v1_notelo_shuffled2_win.txt > PvP01_08_v1_notelo_shuffled2_hairpins.txt &
wait
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_09_v1_notelo_shuffled2_win.txt > PvP01_09_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_10_v1_notelo_shuffled2_win.txt > PvP01_10_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_11_v1_notelo_shuffled2_win.txt > PvP01_11_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_12_v1_notelo_shuffled2_win.txt > PvP01_12_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_13_v1_notelo_shuffled2_win.txt > PvP01_13_v1_notelo_shuffled2_hairpins.txt &
RNAfold --noPS --noconv --paramFile=/home/adam/ViennaRNA-2.4.13/misc/dna_mathews2004.par < PvP01_14_v1_notelo_shuffled2_win.txt > PvP01_14_v1_notelo_shuffled2_hairpins.txt &
wait

#Create the data files with only deltaG
sed -n '3~3p' < PvP01_01_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_01_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_02_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_02_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_03_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_03_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_04_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_04_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_05_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_05_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_06_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_06_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_07_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_07_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_08_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_08_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_09_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_09_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_10_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_10_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_11_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_11_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_12_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_12_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_13_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_13_v1_notelo_shuffled2_data.txt
sed -n '3~3p' < PvP01_14_v1_notelo_shuffled2_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> PvP01_14_v1_notelo_shuffled2_data.txt

#Create the bed files and overall data file
Rscript PvP01_hairpinshuffled_bedgenerator.R

#Determine top 3% for quantile cutoff, save as GENOMENAME_cutoff.txt
