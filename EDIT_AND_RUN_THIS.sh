#Can be further automated with a driver script
# Use find/replace for FILENAME without the file extension, make sure there are no -'s or _'s. Example: "PlasmoDB44PrelictumSGS1.fasta" should be "PlasmoDB44PrelictumSGS1"
# Use find/replace for CHROM_NAME to specify the name of each chromosome within the fasta file you provided. Example: "PRELSG"
# Use find/replace for VERSION to specify the version of each chromosome within the fasta file you provided. Example: "CHROM_NAME_01_v1" should be "v1" 
# Use find/replace for END_TRIMMING to specify the # of bp to trim off both ends of each chromosome
# Use find/replace for WINDOW_SIZE to specify the folding window size
# Use find/replace for CUTOFF to specify the percentile cutoff for shuffled data, needs to be less than 1. Example: 5% = "0.05"

sed 's/rabble/FILENAME/g' < ./bin/SecPred_full_generic.sh|sed 's/rabbble/CHROM_NAME/g'|sed 's/rabbbble/VERSION/g'|sed 's/rabbbbble/END_TRIMMING/g'|sed 's/rabbbbbble/WINDOW_SIZE/g'|sed 's/rabbbbbbble/CUTOFF/g' > SecPred_full_FILENAME.sh
sudo chmod +x SecPred_full_FILENAME.sh
./SecPred_full_FILENAME.sh