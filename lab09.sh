#!/usr/bin/bash
# sat3310 - lab09
# created by srfranco@mtu.edu
# 4/7/2025
#
# Variables 

databasepath="/home/sat3310/Documents/labs/lab09/data/"
databasefile="wireless.dbl"
sqlprog="/usr/bin/sqlite3"

# SQL Statement
sqlstatement="SELECT manuf, AVG(GPSBestAlt), COUNT(*) FROM wireless GROUP BY manuf ORDER BY AVG(GPSBestAlt);"

# Main
$sqlprog $databasepath$databasefile "$sqlstatement"
list=`$sqlprog $databasepath$databasefile "$sqlstatement"`
#the commands between the `s are being executed
for line in $list;
	do 
		#echo $line 
		#echo -e $line | /usr/bin/cut -d '|' -f 1
		#echo -e $line | /usr/bin/cut -d '|' -f 2
		#echo -e $line | /usr/bin/cut -d '|' -f 3
#done

manuf=$(echo -e $line | /usr/bin/cut -d '|' -f 1) 
#this command is taking the output from echo and interpreting the escape characters with the -e
# then it is using the cut command and cutting the | and extracting the first fields column
altitude=$(echo -e $line | /usr/bin/cut -d '|' -f 2)
count=$(echo -e $line | /usr/bin/cut -d '|' -f 3)
echo $manuf, $altitude, $count

done
