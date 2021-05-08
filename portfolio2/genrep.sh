#!/bin/bash

#Portfolio 2
#Task 3
#Jared Neaves 10064584

#select file, makes it easier to edit and test
file='./attacks.html'

#<IGNORE> -----------------------------------------------------------------------------------------------------------------------------
#cat $file
#file2='./sedtest.txt'
#cat $file2
#this was one of my first iterations attempting to get sed to work correctly, it is now redundant, purely left in for my own reference
#cat $file | sed -e 's/<tr>//g' -e 's/<\/td>//g' -e 's/<td>/ /g' -e 's/<\/tr>//g' | grep -i -E 'DDOS|MALWARE|XSS|SQL-INJ|MitM'
#<IGNORE> -----------------------------------------------------------------------------------------------------------------------------

#cat reads the file then pipes to sed
#sed 's/' removes and replaces all http flags with commas ',' then if there are two commas in a row ',,' it replaces with a space then pipes to grep
#grep finds appropriate lines for attack types then pipes to awk
#awk prints the attacks and instances line manually formatted then proceeds to printf (format) the first column and then the sum of the 2,3,4 columns together with a 15 char space between

cat $file | sed -e 's/<[^>]*>/,/g; s/,,/ /g' | grep -i -E 'DDOS|MALWARE|XSS|SQL-INJ|MitM' | awk 'BEGIN {print "Attacks        Instances(Q3)"} {printf "%-15s%s\n", $1, $2+$3+$4}'

exit 0 
