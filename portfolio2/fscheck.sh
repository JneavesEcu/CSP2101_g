#!/bin/bash

#Portfolio 2
#Task 2
#Jared Neaves 10064584

#create function that is passed the filename from the main body and then calculates the word count size and last modified date before echoing that data to console
getprop(){
word_count=$(cat $file_name | wc -w)
#made a redundant attempt at using stat to find file size but found it rounded my number to 0, changed to ls
#byte_size=$(stat --format=%s $file_name)
#file_size=$(($byte_size/1000))
#trying to use stat and awk to format date correctly, now redundant as I found date -r to be easier
#last_modified_date=$(stat -c ‘%y’ $file_name)| awk [print strftime("%d-%m-%Y %H:%M:%S")
file_size=$((ls -sh $file_name) | awk '{print $1}')
last_modified_date=$(date -r $file_name "+%d-%m-%Y %H:%M:%S")


    echo "The file $file_name contains $word_count words and is $file_size in size and was last modified $last_modified_date"
}

#prompt user for filename
read -p "Enter the file name: " file_name
#call the function
getprop $file_name


exit 0
