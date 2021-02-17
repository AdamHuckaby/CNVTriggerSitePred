#Can be further automated with a driver script
# Use find/replace for PbANKA10k without the file extension, make sure there are no -'s or _'s. Example: "PlasmoDB44PrelictumSGS1.fasta" should be "PlasmoDB44PrelictumSGS1"
# Use find/replace for PbANKA to specify the name of each chromosome within the fasta file you provided. Example: "PRELSG"
# Use find/replace for v3 to specify the v3 of each chromosome within the fasta file you provided. Example: "PbANKA_01_v1" should be "v1" 
# Use find/replace for 1000 to specify the # of bp to trim off both ends of each chromosome
# Use find/replace for 50 to specify the folding window size
# Use find/replace for 0.03 to specify the percentile 0.03 for shuffled data, needs to be less than 1. Example: 5% = "0.05"

cp ./Example_files/PbANKA10k.fasta
cp ./Example_files/PbANKA10k_MonoRepeats.csv
sed 's/rabble/PbANKA10k/g' < ./bin/SecPred_full_generic.sh|sed 's/rabbble/PbANKA/g'|sed 's/rabbbble/v3/g'|sed 's/rabbbbble/1000/g'|sed 's/rabbbbbble/50/g'|sed 's/rabbbbbbble/0.03/g' > SecPred_full_PbANKA10k.sh
sudo chmod +x SecPred_full_PbANKA10k.sh
./SecPred_full_PbANKA10k.sh