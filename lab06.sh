#!/usr/bin/bash

# sat3310 - lab06
# created by srfranco@mtu.edu
# 3/18/2025
# This script analyzes the server type of the Fortune 500 companies in Bash.
# Variables
dataurl="https://pages.mtu.edu/~toarney/sat3310/lab07/"
datafile="fortune500.tsv"
#datafile="fortune500.tsv.small"
datapath="/home/sat3310/Documents/labs/lab06/data/"
headerfile="lab06.out"
URLprefix="https://"

timeout=.5;

# give up after timeout seconds when connecting to a website
# and don't output anything when doing so.
curloptions="--silent --fail --connect-timeout $timeout" 
#curl $curloptions -o $datapath$headerfile "dataurl" 

# Download a file
#wget $dataurl$datafile -O $datapath$datafile

#Dos to Unix - remove CR at end of lines
#dos2unix $datapath$datafile

# Make an array
# creates array with the URLs from the datafile using cut command
declare -a mywebsitearray=(`cut -f3 "$datapath$datafile"`)

# Open a file, and read each line
cut -f3 $datapath$datafile | readarray -t mywebsitearray

# Remove first line in array (headers)
mywebsitearray=("${mywebsitearray[@]:1}")

#total sites
numwebsites=${#mywebsitearray[@]}

echo "There are $numwebsites websites in $datapath$datafile."

# for toaline in ${mywebsitearray[@]};
# do
# echo $toaline
# done

# Main loop
echo "Starting main loop"
for line in ${mywebsitearray[@]};
	do
		#echo $line
		let count=count+1
		echo -n "Working... $count of $numwebsites"
		echo -n -e "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
		#echo "$line"
		# gets the header info from the server, and appends it to the header file.
		#echo $URLprefix$line
	#curl -I $curloptions $URLprefix$line | awk '/Server: / { print $2 }' >>$datapath$headerfile
	curl -I $curloptions $line | awk '/Server: / { print $2 } END { if (!NR) print "Empty" }' >> $datapath$headerfile
		#echo "curl -I $curloptions $line"

	done
# Count and sort
# sorts the headerfile and counts unique entries - sorts by number.
sort $datapath$headerfile | uniq -c | sort -n
more $datapath$headerfile
#rm $datapath$headerfile

