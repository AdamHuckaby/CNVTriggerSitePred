###############needs to be further automated so that input can be put in on command line
###############sections that still have ### have not been tested and aren't currently working

#Make necessary directories
mkdir -p rabble/data_scripts
mkdir -p rabble/sequences
mkdir -p rabble/windows
mkdir -p rabble/hairpins


#Copy and make necessary scripts to run
sed 's/input/rabble/g' ./bin/lengths_bedgenerator.R|sed 's/trimsize/rabbbbble/g' > lengths_bedgenerator_rabble.R


#Linearize sequences use this command
sed -e 's/\(^>.*$\)/#\1#/' rabble.fasta| tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabble_linear.fasta


#Exclude regions you don't want including API, MIT, and contigs, consider doing with automatic inclusion of only chromosomes somehow
sed '/API/,+1 d' rabble_linear.fasta|sed '/MIT/,+1 d'|sed '/contig/,+1 d'|sed '/Transfer/,+1 d'|sed '/M76611/,+1 d' > rabble_nocontig.fasta


#Split sequences into separate files
csplit -s -z rabble_nocontig.fasta '/>/' '{*}'
for i in xx* ; do \
 n=$(sed 's/>// ; s/ .*// ; 1q' "$i") ; \
 mv "$i" "$n.fasta" ; \
done


#Get lengths of contigs, write lengths as bed file, write trimmed rabbbble for exclusion
    #If you are using different trimming sizes for different chromosomes, edit the lengths_bedgenerator and use the commented out bedtools getfasta after chromosomes are split instead
    # #Use this for different trimming sizes on different chromosomes: bedtools getfasta -u -a rabbble_01_data.bed -b rabble_trimmed.bed > rabbble_01_data_trimmed.bed
grep -o '^\S*' < rabble_nocontig.fasta > temp_fasta.txt
cat temp_fasta.txt| awk '$0 ~ ">" {print c; c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' > lengths.txt
sed -i '1d' lengths.txt
Rscript lengths_bedgenerator_rabble.R
rm lengths.txt
rm temp*.txt
wait

#Shuffle sequences and to create "random" sequences while maintaining DNA composition to determine rabbbbbbbles for significant/stable hairpins
##############needs to be further automated, install/run EMBOSS shuffleseq  1 shuffle on each chromosome alone, on ubuntu if it isn't installed use "sudo apt-get install emboss"
shuffleseq -sequence rabbble_01_rabbbble.fasta -outseq rabbble_01_shuffle.fasta &
shuffleseq -sequence rabbble_02_rabbbble.fasta -outseq rabbble_02_shuffle.fasta &
shuffleseq -sequence rabbble_03_rabbbble.fasta -outseq rabbble_03_shuffle.fasta &
shuffleseq -sequence rabbble_04_rabbbble.fasta -outseq rabbble_04_shuffle.fasta &
shuffleseq -sequence rabbble_05_rabbbble.fasta -outseq rabbble_05_shuffle.fasta &
shuffleseq -sequence rabbble_06_rabbbble.fasta -outseq rabbble_06_shuffle.fasta &
shuffleseq -sequence rabbble_07_rabbbble.fasta -outseq rabbble_07_shuffle.fasta &
shuffleseq -sequence rabbble_08_rabbbble.fasta -outseq rabbble_08_shuffle.fasta
wait
shuffleseq -sequence rabbble_09_rabbbble.fasta -outseq rabbble_09_shuffle.fasta &
shuffleseq -sequence rabbble_10_rabbbble.fasta -outseq rabbble_10_shuffle.fasta &
shuffleseq -sequence rabbble_11_rabbbble.fasta -outseq rabbble_11_shuffle.fasta &
shuffleseq -sequence rabbble_12_rabbbble.fasta -outseq rabbble_12_shuffle.fasta &
shuffleseq -sequence rabbble_13_rabbbble.fasta -outseq rabbble_13_shuffle.fasta &
shuffleseq -sequence rabbble_14_rabbbble.fasta -outseq rabbble_14_shuffle.fasta
wait


#Linearize shuffled sequences, move sequences to correct folder
sed -e 's/\(^>.*$\)/#\1#/' rabbble_01_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_01_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_02_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_02_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_03_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_03_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_04_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_04_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_05_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_05_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_06_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_06_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_07_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_07_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_08_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_08_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_09_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_09_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_10_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_10_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_11_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_11_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_12_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_12_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_13_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_13_shuffled.fasta
sed -e 's/\(^>.*$\)/#\1#/' rabbble_14_shuffle.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rabbble_14_shuffled.fasta
wait


#Create windower for each chromosome s= substitute, g = global and not just first occurrence
    #####Need update so it runs on any genome/fasta input file
sed 's/input/rabbble_01_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_1.py
sed 's/input/rabbble_02_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_2.py
sed 's/input/rabbble_03_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_3.py
sed 's/input/rabbble_04_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_4.py
sed 's/input/rabbble_05_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_5.py
sed 's/input/rabbble_06_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_6.py
sed 's/input/rabbble_07_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_7.py
sed 's/input/rabbble_08_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_8.py
sed 's/input/rabbble_09_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_9.py
sed 's/input/rabbble_10_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_10.py
sed 's/input/rabbble_11_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_11.py
sed 's/input/rabbble_12_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_12.py
sed 's/input/rabbble_13_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_13.py
sed 's/input/rabbble_14_rabbbble/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_14.py
wait

sed 's/input/rabbble_01_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_1.py
sed 's/input/rabbble_02_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_2.py
sed 's/input/rabbble_03_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_3.py
sed 's/input/rabbble_04_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_4.py
sed 's/input/rabbble_05_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_5.py
sed 's/input/rabbble_06_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_6.py
sed 's/input/rabbble_07_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_7.py
sed 's/input/rabbble_08_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_8.py
sed 's/input/rabbble_09_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_9.py
sed 's/input/rabbble_10_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_10.py
sed 's/input/rabbble_11_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_11.py
sed 's/input/rabbble_12_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_12.py
sed 's/input/rabbble_13_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_13.py
sed 's/input/rabbble_14_shuffled/g' ./bin/windower_generic.py|sed 's/winsize/rabbbbbble/g' > windower_rabble_shuffle_14.py
wait


#Generate windows for each chromosome, change # of "&" lines before "wait" lines to match how many cores you will use. If python 2.x is being used, replace python3 with python
#This script is simply parallelized using bash for longer steps, change to gnu parallel later for better usage
python3 windower_rabble_1.py &
python3 windower_rabble_2.py &
python3 windower_rabble_3.py &
python3 windower_rabble_4.py &
python3 windower_rabble_5.py &
python3 windower_rabble_6.py &
python3 windower_rabble_7.py &
python3 windower_rabble_8.py
wait
python3 windower_rabble_9.py &
python3 windower_rabble_10.py &
python3 windower_rabble_11.py &
python3 windower_rabble_12.py &
python3 windower_rabble_13.py &
python3 windower_rabble_14.py
wait

python3 windower_rabble_shuffle_1.py &
python3 windower_rabble_shuffle_2.py &
python3 windower_rabble_shuffle_3.py &
python3 windower_rabble_shuffle_4.py &
python3 windower_rabble_shuffle_5.py &
python3 windower_rabble_shuffle_6.py &
python3 windower_rabble_shuffle_7.py &
python3 windower_rabble_shuffle_8.py
wait
python3 windower_rabble_shuffle_9.py &
python3 windower_rabble_shuffle_10.py &
python3 windower_rabble_shuffle_11.py &
python3 windower_rabble_shuffle_12.py &
python3 windower_rabble_shuffle_13.py &
python3 windower_rabble_shuffle_14.py
wait


#Fold normal and shuffled sequences after the windows have been generated
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_01_rabbbble_win.txt > rabbble_01_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_02_rabbbble_win.txt > rabbble_02_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_03_rabbbble_win.txt > rabbble_03_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_04_rabbbble_win.txt > rabbble_04_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_05_rabbbble_win.txt > rabbble_05_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_06_rabbbble_win.txt > rabbble_06_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_07_rabbbble_win.txt > rabbble_07_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_08_rabbbble_win.txt > rabbble_08_hairpins.txt &
wait
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_09_rabbbble_win.txt > rabbble_09_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_10_rabbbble_win.txt > rabbble_10_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_11_rabbbble_win.txt > rabbble_11_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_12_rabbbble_win.txt > rabbble_12_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_13_rabbbble_win.txt > rabbble_13_hairpins.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_14_rabbbble_win.txt > rabbble_14_hairpins.txt 
wait

RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_01_shuffled_win.txt > rabbble_01_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_02_shuffled_win.txt > rabbble_02_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_03_shuffled_win.txt > rabbble_03_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_04_shuffled_win.txt > rabbble_04_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_05_shuffled_win.txt > rabbble_05_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_06_shuffled_win.txt > rabbble_06_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_07_shuffled_win.txt > rabbble_07_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_08_shuffled_win.txt > rabbble_08_hairpins_shuffled.txt &
wait
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_09_shuffled_win.txt > rabbble_09_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_10_shuffled_win.txt > rabbble_10_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_11_shuffled_win.txt > rabbble_11_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_12_shuffled_win.txt > rabbble_12_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_13_shuffled_win.txt > rabbble_13_hairpins_shuffled.txt &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < rabbble_14_shuffled_win.txt > rabbble_14_hairpins_shuffled.txt 
wait


#Create the data files with only deltaG
sed -n '3~3p' < rabbble_01_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_01_data.txt
sed -n '3~3p' < rabbble_02_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_02_data.txt
sed -n '3~3p' < rabbble_03_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_03_data.txt
sed -n '3~3p' < rabbble_04_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_04_data.txt
sed -n '3~3p' < rabbble_05_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_05_data.txt
sed -n '3~3p' < rabbble_06_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_06_data.txt
sed -n '3~3p' < rabbble_07_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_07_data.txt
sed -n '3~3p' < rabbble_08_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_08_data.txt
sed -n '3~3p' < rabbble_09_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_09_data.txt
sed -n '3~3p' < rabbble_10_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_10_data.txt
sed -n '3~3p' < rabbble_11_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_11_data.txt
sed -n '3~3p' < rabbble_12_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_12_data.txt
sed -n '3~3p' < rabbble_13_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_13_data.txt
sed -n '3~3p' < rabbble_14_hairpins.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_14_data.txt

sed -n '3~3p' < rabbble_01_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_01_data_shuffled.txt
sed -n '3~3p' < rabbble_02_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_02_data_shuffled.txt
sed -n '3~3p' < rabbble_03_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_03_data_shuffled.txt
sed -n '3~3p' < rabbble_04_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_04_data_shuffled.txt
sed -n '3~3p' < rabbble_05_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_05_data_shuffled.txt
sed -n '3~3p' < rabbble_06_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_06_data_shuffled.txt
sed -n '3~3p' < rabbble_07_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_07_data_shuffled.txt
sed -n '3~3p' < rabbble_08_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_08_data_shuffled.txt
sed -n '3~3p' < rabbble_09_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_09_data_shuffled.txt
sed -n '3~3p' < rabbble_10_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_10_data_shuffled.txt
sed -n '3~3p' < rabbble_11_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_11_data_shuffled.txt
sed -n '3~3p' < rabbble_12_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_12_data_shuffled.txt
sed -n '3~3p' < rabbble_13_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_13_data_shuffled.txt
sed -n '3~3p' < rabbble_14_hairpins_shuffled.txt|cut -c53-58|sed 's/ //g'|sed 's/)//g'> rabbble_14_data_shuffled.txt
wait

#Create bed files of data
sed 's/input/rabbble_01/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_1.R
sed 's/input/rabbble_02/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_2.R
sed 's/input/rabbble_03/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_3.R
sed 's/input/rabbble_04/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_4.R
sed 's/input/rabbble_05/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_5.R
sed 's/input/rabbble_06/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_6.R
sed 's/input/rabbble_07/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_7.R
sed 's/input/rabbble_08/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_8.R
sed 's/input/rabbble_09/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_9.R
sed 's/input/rabbble_10/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_10.R
sed 's/input/rabbble_11/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_11.R
sed 's/input/rabbble_12/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_12.R
sed 's/input/rabbble_13/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_13.R
sed 's/input/rabbble_14/g' < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > hairpingen_rabbble_14.R
wait

Rscript hairpingen_rabbble_1.R
Rscript hairpingen_rabbble_2.R
Rscript hairpingen_rabbble_3.R
Rscript hairpingen_rabbble_4.R
Rscript hairpingen_rabbble_5.R
Rscript hairpingen_rabbble_6.R
Rscript hairpingen_rabbble_7.R
Rscript hairpingen_rabbble_8.R
Rscript hairpingen_rabbble_9.R
Rscript hairpingen_rabbble_10.R
Rscript hairpingen_rabbble_11.R
Rscript hairpingen_rabbble_12.R
Rscript hairpingen_rabbble_13.R
Rscript hairpingen_rabbble_14.R
wait

sed 's/input/rabbble_01/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_1.R
sed 's/input/rabbble_02/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_2.R
sed 's/input/rabbble_03/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_3.R
sed 's/input/rabbble_04/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_4.R
sed 's/input/rabbble_05/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_5.R
sed 's/input/rabbble_06/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_6.R
sed 's/input/rabbble_07/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_7.R
sed 's/input/rabbble_08/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_8.R
sed 's/input/rabbble_09/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_9.R
sed 's/input/rabbble_10/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_10.R
sed 's/input/rabbble_11/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_11.R
sed 's/input/rabbble_12/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_12.R
sed 's/input/rabbble_13/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_13.R
sed 's/input/rabbble_14/g' < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > hairpingen_rabbble_shuffled_14.R
wait

Rscript hairpingen_rabbble_shuffled_1.R
Rscript hairpingen_rabbble_shuffled_2.R
Rscript hairpingen_rabbble_shuffled_3.R
Rscript hairpingen_rabbble_shuffled_4.R
Rscript hairpingen_rabbble_shuffled_5.R
Rscript hairpingen_rabbble_shuffled_6.R
Rscript hairpingen_rabbble_shuffled_7.R
Rscript hairpingen_rabbble_shuffled_8.R
Rscript hairpingen_rabbble_shuffled_9.R
Rscript hairpingen_rabbble_shuffled_10.R
Rscript hairpingen_rabbble_shuffled_11.R
Rscript hairpingen_rabbble_shuffled_12.R
Rscript hairpingen_rabbble_shuffled_13.R
Rscript hairpingen_rabbble_shuffled_14.R
wait


# Determine rabbbbbbble for significance and then subset each chromosome for significant/stable hairpins only
#############needs to be further automated
sed 's/input/rabbble/g' < ./bin/subset_generic.R|sed 's/significant/rabbbbbbble/g' > subset_rabbble.R
Rscript subset_rabbble.R
wait


#Create local minima script for each chromosome
sed 's/input/rabbble_01/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_1.R
sed 's/input/rabbble_02/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_2.R
sed 's/input/rabbble_03/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_3.R
sed 's/input/rabbble_04/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_4.R
sed 's/input/rabbble_05/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_5.R
sed 's/input/rabbble_06/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_6.R
sed 's/input/rabbble_07/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_7.R
sed 's/input/rabbble_08/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_8.R
sed 's/input/rabbble_09/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_9.R
sed 's/input/rabbble_10/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_10.R
sed 's/input/rabbble_11/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_11.R
sed 's/input/rabbble_12/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_12.R
sed 's/input/rabbble_13/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_13.R
sed 's/input/rabbble_14/g' ./bin/local_minima_fixed_generic.R > local_minima_rabbble_14.R
wait


#Generate local minima deltaG of significant hairpins
Rscript local_minima_rabbble_1.R
Rscript local_minima_rabbble_2.R
Rscript local_minima_rabbble_3.R
Rscript local_minima_rabbble_4.R
Rscript local_minima_rabbble_5.R
Rscript local_minima_rabbble_6.R
Rscript local_minima_rabbble_7.R
Rscript local_minima_rabbble_8.R
Rscript local_minima_rabbble_9.R
Rscript local_minima_rabbble_10.R
Rscript local_minima_rabbble_11.R
Rscript local_minima_rabbble_12.R
Rscript local_minima_rabbble_13.R
Rscript local_minima_rabbble_14.R
wait


#Create collapse minima script for each chromosome, have to fix this to give the full size of the contig but it gives the right # currently
sed 's/input/rabbble_01/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_1.R
sed 's/input/rabbble_02/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_2.R
sed 's/input/rabbble_03/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_3.R
sed 's/input/rabbble_04/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_4.R
sed 's/input/rabbble_05/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_5.R
sed 's/input/rabbble_06/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_6.R
sed 's/input/rabbble_07/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_7.R
sed 's/input/rabbble_08/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_8.R
sed 's/input/rabbble_09/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_9.R
sed 's/input/rabbble_10/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_10.R
sed 's/input/rabbble_11/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_11.R
sed 's/input/rabbble_12/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_12.R
sed 's/input/rabbble_13/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_13.R
sed 's/input/rabbble_14/g' ./bin/contig_collapse_fixgeneric.R > contig_collapse_rabbble_14.R
wait

#Collapse minima, contiguous regions with same minima deltaG are collapsed to form a hairpin forming region
Rscript contig_collapse_rabbble_1.R
Rscript contig_collapse_rabbble_2.R
Rscript contig_collapse_rabbble_3.R
Rscript contig_collapse_rabbble_4.R
Rscript contig_collapse_rabbble_5.R
Rscript contig_collapse_rabbble_6.R
Rscript contig_collapse_rabbble_7.R
Rscript contig_collapse_rabbble_8.R
Rscript contig_collapse_rabbble_9.R
Rscript contig_collapse_rabbble_10.R
Rscript contig_collapse_rabbble_11.R
Rscript contig_collapse_rabbble_12.R
Rscript contig_collapse_rabbble_13.R
Rscript contig_collapse_rabbble_14.R
wait

#Clean up temp files
#rm *rabble*.R


#Concatenate collapsed minima for final usable data hairpin forming regions
cat rabbble_01_collapsed.bed rabbble_02_collapsed.bed rabbble_03_collapsed.bed rabbble_04_collapsed.bed rabbble_05_collapsed.bed rabbble_06_collapsed.bed rabbble_07_collapsed.bed rabbble_08_collapsed.bed rabbble_09_collapsed.bed rabbble_10_collapsed.bed rabbble_11_collapsed.bed rabbble_12_collapsed.bed rabbble_13_collapsed.bed rabbble_14_collapsed.bed > rabbble_total_collapsed.bed 
wait

# #Generate AT track bed files and trim ends as before for hairpins, make sure csv is named resembling rabble.csv and make sure there are no -'s or _'s. Example: "PlasmoDB44PrelictumSGS1.csv"
sed 's/input/rabble/g' < ./bin/repeatbedgenerator_generic.R|sed 's/trimsize/rabbbbble/g' > repeatbedgenerator_rabble.R
Rscript repeatbedgenerator_rabble.R
wait


# # 11) Find nearest distance to A/T Track genic and intergenic using ALL collapsed minima
# # 	bedtools closest -D a -t first -a Pf3d7_genicAT.bed -b Pf3d7ch1_notelo_collapsed.bed > Pf3d7ch1dist_genic.bed
# # 12) Subset hairpins and A/T tracks for genic/intergenic using bedtools. Example command includes:
# # 	a. bedtools intersect -u -a Pf3d7ch14_notelo_collapsed.bed -b Pf3d7_genicinfo.bed > Pf3d7ch14_genichairpins.bed
# # 	b. bedtools subtract -a Pf3d7ch14_notelo_collapsed.bed -b Pf3d7_genicinfo.bed > Pf3d7ch14_intergenichairpins.bed
# # 	c. bedtools intersect -u -a Pf3d7ch14_ATtracks.bed -b Pf3d7_genicinfo.bed > Pf3d7ch14_ATtracks.bed
# # 	d. bedtools subtract -a Pf3d7ch14_ATtracks.bed -b Pf3d7_genicinfo.bed > Pf3d7ch14_ATtracks.bed
# # 13) Analyze for further associations including:
# # 	a. Clustering using bedtools cluster etc
# # 	b. Distance from genes/introns/promoters/centromeres etc
# # 	c. Chromatin state

# #Move files to correct folders and clean up intermediate files
rm *shuffle.fasta
rm *linear.fasta
rm *nocontig.fasta
rm *data.txt
rm *data_shuffled.txt
mv SecPred_full_rabble.sh ./rabble/data_scripts
mv *.py ./rabble/data_scripts
mv *.R ./rabble/data_scripts
mv *.fasta ./rabble/sequences
mv *win.txt ./rabble/windows
mv *hairpins.txt ./rabble/hairpins
mv *hairpins_shuffled.txt ./rabble/hairpins
mv *.bed ./rabble/
mv *.csv ./rabble/