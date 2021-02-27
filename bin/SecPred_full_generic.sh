#Make necessary directories
mkdir -p "${FILENAME}/data_scripts"
mkdir -p "${FILENAME}/sequences"
mkdir -p "${FILENAME}/windows"
mkdir -p "${FILENAME}/hairpins"
mkdir -p "${FILENAME}/bedfiles/full_data"
mkdir -p "${FILENAME}/bedfiles/sig_hairpins"
mkdir -p "${FILENAME}/bedfiles/minima"
mkdir -p "${FILENAME}/bedfiles/collapsed_minima"
mkdir -p "${FILENAME}/bedfiles/repeats"


#Linearize sequences from fasta file
sed -e 's/\(^>.*$\)/#\1#/' "${FILENAME}.fasta"| tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${FILENAME}_linear.fasta"


#Exclude regions you don't want including API, MIT, and contigs, consider doing with automatic inclusion of only chromosomes somehow
#If you are using different exclusion sizes/chromsomes for different chromosomes, edit the lengths_bedgenerator.R script and use the following command using your custom exclude.bed file instead
    #bedtools getfasta -u -a "${CHROM}_01_data.bed -b ${FILENAME}_trimmed.bed > "${CHROM}_01_data_trimmed.bed
sed '/API/,+1 d' "${FILENAME}_linear.fasta"|sed '/MIT/,+1 d'|sed '/contig/,+1 d'|sed '/Transfer/,+1 d'|sed '/M76611/,+1 d' > "${FILENAME}_nocontig.fasta"


#Split sequences from fasta file into separate files
csplit -s -z "${FILENAME}_nocontig.fasta" '/>/' '{*}'
for i in xx* ; do \
 n=$(sed 's/>// ; s/ .*// ; 1q' "$i") ; \
 mv "$i" "$n.fasta" ; \
done


#Get lengths of contigs, write lengths as bed file
grep -o '^\S*' < "${FILENAME}_nocontig.fasta" > temp_fasta.txt
cat temp_fasta.txt| awk '$0 ~ ">" {print c; c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' > lengths.txt
sed -i '1d' lengths.txt

#Copy and make necessary scripts to run
sed "s/input/${FILENAME}/g" ./bin/lengths_bedgenerator.R|sed "s/trimsize/${TRIMMING}/g" > "lengths_bedgenerator_${FILENAME}.R"
Rscript "lengths_bedgenerator_${FILENAME}.R"
rm lengths.txt
rm temp*.txt
wait

#Add spaces to give status of what the script is doing
#yes '' | sed 5q
#echo '*****************Finding local minima*****************'
#Shuffle sequences and to create "random" sequences while maintaining DNA composition to determine ${SIGTHRESHOLD}s for significant/stable hairpins
##############needs to be further automated, install/run EMBOSS shuffleseq  1 shuffle on each chromosome alone, on ubuntu if it isn't installed use "sudo apt-get install emboss"
shuffleseq -sequence "${CHROM}_01_${VERSION}.fasta" -outseq "${CHROM}_01_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_02_${VERSION}.fasta" -outseq "${CHROM}_02_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_03_${VERSION}.fasta" -outseq "${CHROM}_03_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_04_${VERSION}.fasta" -outseq "${CHROM}_04_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_05_${VERSION}.fasta" -outseq "${CHROM}_05_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_06_${VERSION}.fasta" -outseq "${CHROM}_06_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_07_${VERSION}.fasta" -outseq "${CHROM}_07_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_08_${VERSION}.fasta" -outseq "${CHROM}_08_shuffle.fasta" 2> /dev/null 
wait
shuffleseq -sequence "${CHROM}_09_${VERSION}.fasta" -outseq "${CHROM}_09_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_10_${VERSION}.fasta" -outseq "${CHROM}_10_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_11_${VERSION}.fasta" -outseq "${CHROM}_11_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_12_${VERSION}.fasta" -outseq "${CHROM}_12_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_13_${VERSION}.fasta" -outseq "${CHROM}_13_shuffle.fasta" 2> /dev/null &
shuffleseq -sequence "${CHROM}_14_${VERSION}.fasta" -outseq "${CHROM}_14_shuffle.fasta" 2> /dev/null 
wait


#Linearize shuffled sequences, move sequences to correct folder
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_01_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_01_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_02_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_02_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_03_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_03_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_04_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_04_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_05_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_05_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_06_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_06_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_07_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_07_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_08_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_08_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_09_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_09_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_10_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_10_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_11_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_11_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_12_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_12_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_13_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_13_shuffled.fasta"
sed -e 's/\(^>.*$\)/#\1#/' "${CHROM}_14_shuffle.fasta" | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > "${CHROM}_14_shuffled.fasta"
wait


#Create windower for each chromosome s= substitute, g = global and not just first occurrence
    #####Need update so it runs on any genome/fasta input file
sed "s/input/${CHROM}_01_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_1.py"
sed "s/input/${CHROM}_02_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_2.py"
sed "s/input/${CHROM}_03_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_3.py"
sed "s/input/${CHROM}_04_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_4.py"
sed "s/input/${CHROM}_05_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_5.py"
sed "s/input/${CHROM}_06_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_6.py"
sed "s/input/${CHROM}_07_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_7.py"
sed "s/input/${CHROM}_08_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_8.py"
sed "s/input/${CHROM}_09_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_9.py"
sed "s/input/${CHROM}_10_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_10.py"
sed "s/input/${CHROM}_11_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_11.py"
sed "s/input/${CHROM}_12_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_12.py"
sed "s/input/${CHROM}_13_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_13.py"
sed "s/input/${CHROM}_14_${VERSION}/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_14.py"
wait

sed "s/input/${CHROM}_01_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_1.py"
sed "s/input/${CHROM}_02_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_2.py"
sed "s/input/${CHROM}_03_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_3.py"
sed "s/input/${CHROM}_04_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_4.py"
sed "s/input/${CHROM}_05_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_5.py"
sed "s/input/${CHROM}_06_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_6.py"
sed "s/input/${CHROM}_07_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_7.py"
sed "s/input/${CHROM}_08_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_8.py"
sed "s/input/${CHROM}_09_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_9.py"
sed "s/input/${CHROM}_10_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_10.py"
sed "s/input/${CHROM}_11_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_11.py"
sed "s/input/${CHROM}_12_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_12.py"
sed "s/input/${CHROM}_13_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_13.py"
sed "s/input/${CHROM}_14_shuffled/g" ./bin/windower_generic.py|sed "s/winsize/${WINDOWSIZE}/g" > "windower_${FILENAME}_shuffle_14.py"
wait


#Generate windows for each chromosome, change # of "&" lines before "wait" lines to match how many cores you will use. If python 2.x is being used, replace python3 with python
#This script is simply parallelized using bash for longer steps, change to gnu parallel later for better usage
python3 "windower_${FILENAME}_1.py" &
python3 "windower_${FILENAME}_2.py" &
python3 "windower_${FILENAME}_3.py" &
python3 "windower_${FILENAME}_4.py" &
python3 "windower_${FILENAME}_5.py" &
python3 "windower_${FILENAME}_6.py" &
python3 "windower_${FILENAME}_7.py" &
python3 "windower_${FILENAME}_8.py"
wait
python3 "windower_${FILENAME}_9.py" &
python3 "windower_${FILENAME}_10.py" &
python3 "windower_${FILENAME}_11.py" &
python3 "windower_${FILENAME}_12.py" &
python3 "windower_${FILENAME}_13.py" &
python3 "windower_${FILENAME}_14.py"
wait

python3 "windower_${FILENAME}_shuffle_1.py" &
python3 "windower_${FILENAME}_shuffle_2.py" &
python3 "windower_${FILENAME}_shuffle_3.py" &
python3 "windower_${FILENAME}_shuffle_4.py" &
python3 "windower_${FILENAME}_shuffle_5.py" &
python3 "windower_${FILENAME}_shuffle_6.py" &
python3 "windower_${FILENAME}_shuffle_7.py" &
python3 "windower_${FILENAME}_shuffle_8.py"
wait
python3 "windower_${FILENAME}_shuffle_9.py" &
python3 "windower_${FILENAME}_shuffle_10.py" &
python3 "windower_${FILENAME}_shuffle_11.py" &
python3 "windower_${FILENAME}_shuffle_12.py" &
python3 "windower_${FILENAME}_shuffle_13.py" &
python3 "windower_${FILENAME}_shuffle_14.py"
wait

#Add spaces to give status of what the script is doing
#yes '' | sed 5q
#echo '*****************Finding local minima*****************'

#Fold normal and shuffled sequences after the windows have been generated
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_01_${VERSION}_win.txt" > "${CHROM}_01_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_02_${VERSION}_win.txt" > "${CHROM}_02_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_03_${VERSION}_win.txt" > "${CHROM}_03_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_04_${VERSION}_win.txt" > "${CHROM}_04_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_05_${VERSION}_win.txt" > "${CHROM}_05_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_06_${VERSION}_win.txt" > "${CHROM}_06_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_07_${VERSION}_win.txt" > "${CHROM}_07_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_08_${VERSION}_win.txt" > "${CHROM}_08_hairpins.txt" 2> /dev/null &
wait
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_09_${VERSION}_win.txt" > "${CHROM}_09_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_10_${VERSION}_win.txt" > "${CHROM}_10_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_11_${VERSION}_win.txt" > "${CHROM}_11_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_12_${VERSION}_win.txt" > "${CHROM}_12_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_13_${VERSION}_win.txt" > "${CHROM}_13_hairpins.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_14_${VERSION}_win.txt" > "${CHROM}_14_hairpins.txt" 2> /dev/null
wait

RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_01_shuffled_win.txt" > "${CHROM}_01_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_02_shuffled_win.txt" > "${CHROM}_02_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_03_shuffled_win.txt" > "${CHROM}_03_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_04_shuffled_win.txt" > "${CHROM}_04_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_05_shuffled_win.txt" > "${CHROM}_05_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_06_shuffled_win.txt" > "${CHROM}_06_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_07_shuffled_win.txt" > "${CHROM}_07_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_08_shuffled_win.txt" > "${CHROM}_08_hairpins_shuffled.txt" 2> /dev/null &
wait
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_09_shuffled_win.txt" > "${CHROM}_09_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_10_shuffled_win.txt" > "${CHROM}_10_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_11_shuffled_win.txt" > "${CHROM}_11_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_12_shuffled_win.txt" > "${CHROM}_12_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_13_shuffled_win.txt" > "${CHROM}_13_hairpins_shuffled.txt" 2> /dev/null &
RNAfold --noPS --noconv --paramFile=./bin/folding_parameters/dna_mathews2004.par < "${CHROM}_14_shuffled_win.txt" > "${CHROM}_14_hairpins_shuffled.txt" 2> /dev/null
wait


#Create the data files with only deltaG
sed -n '3~3p' < "${CHROM}_01_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_01_data.txt"
sed -n '3~3p' < "${CHROM}_02_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_02_data.txt"
sed -n '3~3p' < "${CHROM}_03_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_03_data.txt"
sed -n '3~3p' < "${CHROM}_04_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_04_data.txt"
sed -n '3~3p' < "${CHROM}_05_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_05_data.txt"
sed -n '3~3p' < "${CHROM}_06_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_06_data.txt"
sed -n '3~3p' < "${CHROM}_07_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_07_data.txt"
sed -n '3~3p' < "${CHROM}_08_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_08_data.txt"
sed -n '3~3p' < "${CHROM}_09_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_09_data.txt"
sed -n '3~3p' < "${CHROM}_10_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_10_data.txt"
sed -n '3~3p' < "${CHROM}_11_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_11_data.txt"
sed -n '3~3p' < "${CHROM}_12_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_12_data.txt"
sed -n '3~3p' < "${CHROM}_13_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_13_data.txt"
sed -n '3~3p' < "${CHROM}_14_hairpins.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_14_data.txt"

sed -n '3~3p' < "${CHROM}_01_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_01_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_02_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_02_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_03_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_03_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_04_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_04_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_05_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_05_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_06_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_06_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_07_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_07_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_08_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_08_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_09_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_09_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_10_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_10_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_11_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_11_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_12_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_12_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_13_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_13_data_shuffled.txt"
sed -n '3~3p' < "${CHROM}_14_hairpins_shuffled.txt"|cut -c53-58|sed 's/ //g'|sed 's/)//g'> "${CHROM}_14_data_shuffled.txt"
wait

#Create bed files of data
sed "s/input/${CHROM}_01/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_1.R"
sed "s/input/${CHROM}_02/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_2.R"
sed "s/input/${CHROM}_03/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_3.R"
sed "s/input/${CHROM}_04/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_4.R"
sed "s/input/${CHROM}_05/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_5.R"
sed "s/input/${CHROM}_06/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_6.R"
sed "s/input/${CHROM}_07/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_7.R"
sed "s/input/${CHROM}_08/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_8.R"
sed "s/input/${CHROM}_09/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_9.R"
sed "s/input/${CHROM}_10/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_10.R"
sed "s/input/${CHROM}_11/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_11.R"
sed "s/input/${CHROM}_12/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_12.R"
sed "s/input/${CHROM}_13/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_13.R"
sed "s/input/${CHROM}_14/g" < ./bin/hairpingen_generic.R|sed 's/TYPE//g' > "hairpingen_${CHROM}_14.R"
wait

Rscript "hairpingen_${CHROM}_1.R"
Rscript "hairpingen_${CHROM}_2.R"
Rscript "hairpingen_${CHROM}_3.R"
Rscript "hairpingen_${CHROM}_4.R"
Rscript "hairpingen_${CHROM}_5.R"
Rscript "hairpingen_${CHROM}_6.R"
Rscript "hairpingen_${CHROM}_7.R"
Rscript "hairpingen_${CHROM}_8.R"
Rscript "hairpingen_${CHROM}_9.R"
Rscript "hairpingen_${CHROM}_10.R"
Rscript "hairpingen_${CHROM}_11.R"
Rscript "hairpingen_${CHROM}_12.R"
Rscript "hairpingen_${CHROM}_13.R"
Rscript "hairpingen_${CHROM}_14.R"
wait

sed "s/input/${CHROM}_01/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_1.R"
sed "s/input/${CHROM}_02/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_2.R"
sed "s/input/${CHROM}_03/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_3.R"
sed "s/input/${CHROM}_04/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_4.R"
sed "s/input/${CHROM}_05/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_5.R"
sed "s/input/${CHROM}_06/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_6.R"
sed "s/input/${CHROM}_07/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_7.R"
sed "s/input/${CHROM}_08/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_8.R"
sed "s/input/${CHROM}_09/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_9.R"
sed "s/input/${CHROM}_10/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_10.R"
sed "s/input/${CHROM}_11/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_11.R"
sed "s/input/${CHROM}_12/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_12.R"
sed "s/input/${CHROM}_13/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_13.R"
sed "s/input/${CHROM}_14/g" < ./bin/hairpingen_generic.R|sed 's/TYPE/_shuffled/g' > "hairpingen_${CHROM}_shuffled_14.R"
wait

Rscript "hairpingen_${CHROM}_shuffled_1.R"
Rscript "hairpingen_${CHROM}_shuffled_2.R"
Rscript "hairpingen_${CHROM}_shuffled_3.R"
Rscript "hairpingen_${CHROM}_shuffled_4.R"
Rscript "hairpingen_${CHROM}_shuffled_5.R"
Rscript "hairpingen_${CHROM}_shuffled_6.R"
Rscript "hairpingen_${CHROM}_shuffled_7.R"
Rscript "hairpingen_${CHROM}_shuffled_8.R"
Rscript "hairpingen_${CHROM}_shuffled_9.R"
Rscript "hairpingen_${CHROM}_shuffled_10.R"
Rscript "hairpingen_${CHROM}_shuffled_11.R"
Rscript "hairpingen_${CHROM}_shuffled_12.R"
Rscript "hairpingen_${CHROM}_shuffled_13.R"
Rscript "hairpingen_${CHROM}_shuffled_14.R"
wait

#Add spaces to give status of what the script is doing
#yes '' | sed 5q
#echo '*****************Finding local minima*****************'

# Determine deltaG for significance and then subset each chromosome for significant/stable hairpins only
#############needs to be further automated
sed "s/input/${CHROM}/g" < ./bin/subset_generic.R|sed "s/significant/${SIGTHRESHOLD}/g" > "subset_${CHROM}.R"
Rscript "subset_${CHROM}.R"
wait


#Create local minima script for each chromosome
sed "s/input/${CHROM}_01/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_1.R"
sed "s/input/${CHROM}_02/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_2.R"
sed "s/input/${CHROM}_03/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_3.R"
sed "s/input/${CHROM}_04/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_4.R"
sed "s/input/${CHROM}_05/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_5.R"
sed "s/input/${CHROM}_06/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_6.R"
sed "s/input/${CHROM}_07/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_7.R"
sed "s/input/${CHROM}_08/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_8.R"
sed "s/input/${CHROM}_09/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_9.R"
sed "s/input/${CHROM}_10/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_10.R"
sed "s/input/${CHROM}_11/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_11.R"
sed "s/input/${CHROM}_12/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_12.R"
sed "s/input/${CHROM}_13/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_13.R"
sed "s/input/${CHROM}_14/g" ./bin/local_minima_fixed_generic.R > "local_minima_${CHROM}_14.R"
wait

#Add spaces to give status of what the script is doing
#yes '' | sed 5q
#echo '*****************Finding local minima*****************'

#Generate local minima deltaG of significant hairpins
Rscript "local_minima_${CHROM}_1.R" &
Rscript "local_minima_${CHROM}_2.R" &
Rscript "local_minima_${CHROM}_3.R" &
Rscript "local_minima_${CHROM}_4.R" &
Rscript "local_minima_${CHROM}_5.R" &
Rscript "local_minima_${CHROM}_6.R" &
Rscript "local_minima_${CHROM}_7.R" &
Rscript "local_minima_${CHROM}_8.R"
wait
Rscript "local_minima_${CHROM}_9.R" &
Rscript "local_minima_${CHROM}_10.R" &
Rscript "local_minima_${CHROM}_11.R" &
Rscript "local_minima_${CHROM}_12.R" &
Rscript "local_minima_${CHROM}_13.R" &
Rscript "local_minima_${CHROM}_14.R" 
wait


#Create collapse minima script for each chromosome, have to fix this to give the full size of the contig but it gives the right # currently
sed "s/input/${CHROM}_01/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_1.R"
sed "s/input/${CHROM}_02/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_2.R"
sed "s/input/${CHROM}_03/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_3.R"
sed "s/input/${CHROM}_04/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_4.R"
sed "s/input/${CHROM}_05/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_5.R"
sed "s/input/${CHROM}_06/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_6.R"
sed "s/input/${CHROM}_07/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_7.R"
sed "s/input/${CHROM}_08/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_8.R"
sed "s/input/${CHROM}_09/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_9.R"
sed "s/input/${CHROM}_10/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_10.R"
sed "s/input/${CHROM}_11/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_11.R"
sed "s/input/${CHROM}_12/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_12.R"
sed "s/input/${CHROM}_13/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_13.R"
sed "s/input/${CHROM}_14/g" ./bin/contig_collapse_fixgeneric.R > "contig_collapse_${CHROM}_14.R"
wait

#Add spaces to give status of what the script is doing
#yes '' | sed 5q
#echo '*****************Finding local minima*****************'

#Collapse minima, contiguous regions with same minima deltaG are collapsed to form a hairpin forming region
Rscript "contig_collapse_${CHROM}_1.R"
Rscript "contig_collapse_${CHROM}_2.R"
Rscript "contig_collapse_${CHROM}_3.R"
Rscript "contig_collapse_${CHROM}_4.R"
Rscript "contig_collapse_${CHROM}_5.R"
Rscript "contig_collapse_${CHROM}_6.R"
Rscript "contig_collapse_${CHROM}_7.R"
Rscript "contig_collapse_${CHROM}_8.R"
Rscript "contig_collapse_${CHROM}_9.R"
Rscript "contig_collapse_${CHROM}_10.R"
Rscript "contig_collapse_${CHROM}_11.R"
Rscript "contig_collapse_${CHROM}_12.R"
Rscript "contig_collapse_${CHROM}_13.R"
Rscript "contig_collapse_${CHROM}_14.R"
wait

#Clean up temp files
#rm *${FILENAME}*.R

#Concatenate collapsed minima for final usable data hairpin forming regions
cat "${CHROM}_01_collapsed.bed" "${CHROM}_02_collapsed.bed" "${CHROM}_03_collapsed.bed" "${CHROM}_04_collapsed.bed" "${CHROM}_05_collapsed.bed" "${CHROM}_06_collapsed.bed" "${CHROM}_07_collapsed.bed" "${CHROM}_08_collapsed.bed" "${CHROM}_09_collapsed.bed" "${CHROM}_10_collapsed.bed" "${CHROM}_11_collapsed.bed" "${CHROM}_12_collapsed.bed" "${CHROM}_13_collapsed.bed" "${CHROM}_14_collapsed.bed" > "${CHROM}_total_collapsed.bed" 
wait

# #Generate AT track bed files and trim ends as before for hairpins, make sure csv is named resembling ${FILENAME}.csv and make sure there are no -'s or _'s. Example: "PlasmoDB44PrelictumSGS1.csv"
sed "s/input/${FILENAME}/g" < ./bin/repeatbedgenerator_generic.R|sed "s/trimsize/${TRIMMING}/g" > "repeatbedgenerator_${FILENAME}.R"
Rscript "repeatbedgenerator_${FILENAME}.R"
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
mv *.py "./${FILENAME}/data_scripts"
mv *.R "./${FILENAME}/data_scripts"
mv *.fasta "./${FILENAME}/sequences"
mv *win.txt "./${FILENAME}/windows"
mv *hairpins.txt "./${FILENAME}/hairpins"
mv *hairpins_shuffled.txt "./${FILENAME}/hairpins"
mv *data.bed "./${FILENAME}/bedfiles/full_data"
mv *data_shuffled.bed "./${FILENAME}/bedfiles/full_data"
mv *sig.bed "./${FILENAME}/bedfiles/sig_hairpins"
mv *minima.bed "./${FILENAME}/bedfiles/minima"
mv *collapsed.bed "./${FILENAME}/bedfiles/collapsed_minima"
mv *full.bed "./${FILENAME}/bedfiles/repeats"
mv *lengths.bed "./${FILENAME}/bedfiles"
mv *.csv "./${FILENAME}/"