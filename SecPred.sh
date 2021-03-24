#!/bin/bash

#Getops takes which options are valid in "a" then populates opt with value of the current option
#Options that themselves have arguments are signified by appending : to options "a:"
FILENAME=""			# FASTA FILENAME
CHROM=""			# NAME OF CHROMOSOME
TRIMMING=""			# SEQUENCE END TRIMMING LENGTH
WINDOWSIZE=""		# FOLDING WINDOW SIZE
SIGTHRESHOLD=""		# SIGNIFICANCE THRESHOLD

usage() {                                 # Function: Print a help message for correct usage.
  		echo ""
  		echo "Usage: $0 [ -f FASTA FILENAME ] [ -t SEQUENCE END TRIMMING LENGTH ] [ -w FOLDING WINDOW SIZE ] [ -s SIGNIFICANCE THRESHOLD, 0<s<1 ]" 1>&2
  		echo "" 
	}

exit_abnormal() {                         # Function: Exit with error.
  		usage
  		exit 1
	}

while getopts ":f:t:w:s:" opt; do 			#While loop using getopts to set f, t, w, s inputs. Each loop puts the input into opt
	case "${opt}" in 								#What to do for each opt passed in
	    f)		#option to specify fasta file, needs to gather file extension name and name of each chromosome including version
	     	FILENAME=${OPTARG} 					#Set variable FILENAME to input
	     	CHROM=$(sed 's/>// ; s/ .*// ; 1q' "$FILENAME"|sed 's/_.*//g')
	     	VERSION=$(sed 's/>// ; s/ .*// ; 1q' "$FILENAME"|sed 's/.*_//g')
	     	if [ ! -f "./$FILENAME" ] ; then   # if FILENAME is not found in current directory
	     	    echo ""
        		echo "Error: fasta file not found in current directory."
        		exit_abnormal                     # Exit abnormally.
      		fi
      		FILENAME=${FILENAME//\.fasta/}					#Remove .fasta from FILENAME
	      ;;
	    
	    t)		#option to specify trimming size, will remove this later in favor of a bedfile for trimming using bedtools
	    	TRIMMING=${OPTARG}
	      	
	      ;;
	    
	    w) 		#option to specify window size
	    	WINDOWSIZE=${OPTARG}
	     		if ! [[ $WINDOWSIZE =~ $re_isanum ]] ; then   # if $TIMES not whole:
        		echo "Error: Folding window size must be a positive, whole number >= 10."
        		exit_abnormal
        		exit 1
      			elif [ $WINDOWSIZE -lt "10" ]; then       # If it's zero:
        		echo "Error: Windowsize must be >= 10."
        		exit_abnormal                     # Exit abnormally.
      			fi
	      ;;
	    
	    s) 		#option to specify significance threshold
	    	SIGTHRESHOLD=${OPTARG}
	     		re_isanum='[0-9]*\.[0-9]+'		#regex to match 0 or more numbers before a . then 1 or more digits after decimal
	     		if ! [[ $SIGTHRESHOLD =~ $re_isanum ]] || (( $(echo "$SIGTHRESHOLD > 1"|bc -l) )) ; then   # Use bc (bash calculator) to evaluate if SIGTHRESHOLD is not a decimal or is greater than 1
        		echo "Error: Significance threshold must be a decimal 0 < s < 1."
        		exit_abnormal                     # Exit abnormally.
      			fi
	      ;;

	    \?) 		#handles what to do if an invalid option is provided. Gives usage message. Only possible with : before options ":a"
	      echo ""
	      echo "Invalid option: -${OPTARG}" >&2
	      exit_abnormal
	      ;;
	    
	    :)  #Error message for missing argument for a provided option
	      echo ""
	      echo "Option -${OPTARG} requires an argument."
	      exit_abnormal
	      ;;

		esac  				#case backwards to end the case statement
	
	done 					#End while argument

#Require input for variables in order for script to run
if [[ $FILENAME == "" ]] || [[ $TRIMMING == ""  ]] || [[ $WINDOWSIZE == ""  ]] || [[ $SIGTHRESHOLD == ""  ]] ; 		#If any of the input parameters are empty ""
then   # if FILENAME is not found in current directory
	echo ""
    echo "Error: Required parameter(s) missing."
    echo ""
    exit_abnormal                     # Exit abnormally.
else       #Export variables gathered in this script for usage in the generic script and create a file with the run parameters and command line output
	sudo chmod +rwx ./bin/SecPred_full_generic.sh
	echo 'Total Time Elapsed:'
	export FILENAME="${FILENAME}" CHROM="${CHROM}" TRIMMING="${TRIMMING}" WINDOWSIZE="${WINDOWSIZE}" SIGTHRESHOLD="${SIGTHRESHOLD}" VERSION="${VERSION}"
	time ./bin/SecPred_full_generic.sh
fi