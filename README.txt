CNVTriggerSitePred is a suite of scripts that is intended to take a fasta file and identify all possible regions of the genome that DNA hairpins are likely to form and cause CNV trigger sites when near long mononucleotide A/T tracks.


#######TABLE OF CONTENTS#######
1.  AVAILABILITY AND MAINTENANCE
2.  VERSION UPDATES
2.  DEPENDENCIES
3.  INSTALLATION
4.  USAGE
5.  KNOWN BUGS
6.  CONTACT

-------

#######AVAILABILITY AND MAINTENANCE#######
Will be available through download from Adam Huckaby's github with binaries/.deb files for Ubuntu 18.04 programs included in the bin. See contact if not working.

-------

#######VERSION UPDATES#######
1.1 - The OG
    a. This is the original and is hard-coded to work on Plasmodium genomes with no contigs, apicoplast, or mitochondria. This version also requires using find/replace within SecPred_full_generic.sh script to create the script to run each genome
    b. This version has binaries for Phobos Repeat Finder and Vienna RNAfold that work on Ubuntu 18.04 included in the binaries.gz folder

-------

#######DEPENDENCIES#######

Has only been tested on Ubuntu 18.04 but should work with the following dependencies correctly installed:
1)  Bash
2)  python3
3)  R statistics software
    a. python2.x also works but the SecPred_full_generic.sh script should be modified from "python3" to python
4)  Phobos repeat finder
5)  EMBOSS software package for molecular biology
6)  Vienna RNAfold
7)  Bedtools
8)  Optional for debugging: Rstudio
    
-------

#######INSTALLATION#######

1)  Check python version

2)  Install R. Ubuntu 18.04 default is R version 3.4.4 (2018-03-15) -- "Someone to Lean On"
    sudo apt-get update
    sudo apt-get install r-base r-base-dev

3)  Install EMBOSS software package. Check it is correctly installed by running shuffleseq
    sudo apt-get install emboss
    shuffleseq

4)  Install Vienna RNAfold using pre-compiled binary for Ubuntu 18.04 from https://www.tbi.univie.ac.at/RNA/# or github

5)  Download and install bedtools
    sudo apt-get install bedtools

6)  Set permissions for CNVTriggerSitePred
    
7)  Optional: Install Rstudio for debugging
    a. Download appropriate Rstudio deb from Rstudio website (bionic beaver 18.04)


-------

#######USAGE#######
1)  Place unpacked .fasta and .csv file in the primary folder along with the EDIT_AND_RUN_THIS.sh script.

2)  Follow directions to edit the EDIT_AND_RUN_THIS.sh script.

3)  Check the folder that has been created in the CNVTriggerSitePred main directory with the associated filename. All .bed files should be in the main directory and all intermediate files and data_scripts should be in their respective folders.

4)  Check that there is a .bed file of collapsed minima for each chromosome at the end and debug as necessary.

5)  Using bedtools, explore .bed files/.gff for CNV trigger site distances, genes, and other associated features.

-------

#######KNOWN BUGS#######

VERSION 1.1 - The OG
1)  Last two or three entries in minima files sometimes have overlapping start sites. This causes the contig_collapse_generic.R script to fail
    a. This can sometimes be fixed by manually running the relevant files/scripts within Rstudio
    b. Will attempt to fix this

-------

#######CONTACT#######

Primary Investigator's email: Jennifer Guler - jlg5fw@virginia.edu
Programmer's email: Adam Huckaby - adam.huckaby17@gmail.com

-------

