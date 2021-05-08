#!/bin/bash

#Portfolio 2
#Task 4
#Jared Neaves 10064584

#select file, easier to test if script line deals with file as a var
file='./usrpwords.txt'

#read file with cat and pipe to awk
#awk use number of records greater than 1 to skip first line then pipes back into awk to make the code easier to understand rather than stacking awk commands
#awk then makes conditional if statement, if length -ge 8 and contains digits and contains uppercase it prints meets requirements; else it prints doesnt meet
cat $file | awk '(NR>1)' | awk '{
    if(length($2) >= 8 && $2 ~ "[[:digit:]]" && $2 ~ "[[:upper:]]")
    {
        print $2, " - meets password strength requirements"
    } 
    else
    {
        print $2, " - does NOT meet password strength requirements"
    }
    }'


exit 0