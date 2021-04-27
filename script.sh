# The script for listing all the files and folders in a directory and inside that directory and more inside it.
#
# Author : Rishav Das (https://github.com/rdofficial/)
#

# Defining the ANSII color codes
red="\033[91m"
green="\033[92m"
yellow="\033[93m"
blue="\033[94m"
defcol="\033[00m"

fLister() {
	# The function for listing the files

	ls -1 $1 | while read fLoc
	do
		fLoc=$1"/"$fLoc
		if [[ -d "${fLoc}" ]]; then
			# If the fetched name is a directory

			fLister "${fLoc}"
		else
			printf "[#] ${yellow}${fLoc}${defcol}\n"
		fi
	done
}

printf "\n${yellow}Listing the all the contents of ${1} : ${defcol}\n"
fLister "${1}"
command=$(fLister "${1}" | wc -l)
echo
echo -e "Number of files in the folder $1 : $command"
