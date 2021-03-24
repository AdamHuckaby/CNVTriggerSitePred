#!/bin/bash
# Use find/replace for PbANKA10k without the file extension, make sure there are no -'s or _'s. Example: "PlasmoDB44PrelictumSGS1.fasta" should be "PlasmoDB44PrelictumSGS1"
# Use find/replace for PbANKA to specify the name of each chromosome within the fasta file you provided. Example: "PRELSG"
# Use find/replace for v3 to specify the v3 of each chromosome within the fasta file you provided. Example: "PbANKA_01_v1" should be "v1" 
# Use find/replace for 1000 to specify the # of bp to trim off both ends of each chromosome
# Use find/replace for 50 to specify the folding window size
# Use find/replace for 0.03 to specify the percentile 0.03 for shuffled data, needs to be less than 1. Example: 5% = "0.05"

#Set up wrapper function display running status
main_function () {	
	cp ./Example_files/PbANKA10k.fasta .
	cp ./Example_files/PbANKA10k_MonoRepeats.csv .
	cp ./bin/SecPred_full_generic.sh SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/data_scripts|${FILENAME}_test/data_scripts|g' SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/sequences|${FILENAME}_test/sequences|g' SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/windows|${FILENAME}_test/windows|g' SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/hairpins|${FILENAME}_test/hairpins|g' SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/bedfiles|${FILENAME}_test/bedfiles|g' SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/data_scripts|${FILENAME}_test/data_scripts|g' SecPred_full_PbANKA10k.sh
	sed -i 's|${FILENAME}/"|${FILENAME}_test/"|g' SecPred_full_PbANKA10k.sh
	export FILENAME="PbANKA10k" CHROM="PbANKA" TRIMMING="1000" WINDOWSIZE="50" SIGTHRESHOLD="0.03" VERSION="v3"
	sudo chmod +x SecPred_full_PbANKA10k.sh
	./SecPred_full_PbANKA10k.sh
	echo 'Total Time Elapsed:'
}

#Display runtime for analysis
time main_function