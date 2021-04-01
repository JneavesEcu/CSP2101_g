#!/bin/bash

#Portfolio 1
#Task 3
#Jared Neaves 10064584

#get filepath $1 and navigate there
cd $1
#initialise vars and make sure they begin at 0
#files=0 TESTING
#dir=0  TESTING
files_y=0
files_n=0
dir_y=0
dir_n=0

#initialise for loop to iterate through the specified directory
for i in *; do
    if [ -d $i ]; then #if its a directory
        #dir=$(($dir+1)) TESTING
        [ "$(ls -A $i)" ] && dir_y=$(($dir_y+1)) || dir_n=$(($dir_n+1)) #search directory with ls -A if this lists files then dir_y is iterated if not, then dir_n is iterated
    elif [ -f $i ]; then #else if it is a file
       #files=$(($files+1)) TESTING 
        if [ -s "$i" ]; then #if the file contains data iterate files_y
            files_y=$(($files_y+1))
        else #else if the file contains no data then iterate files_n 
            files_n=$(($files_n+1))
        fi
    else
    echo "error" #testing error output
    fi
done

#echo -e "files_y $files_y\nfiles_n $files_n\ndir_y $dir_y\ndir_n $dir_n\nTOTAL FILES:   $files\nTOTAL DIRS:    $dir" TESTING

#output data in correct format
echo -e "The '$1' directory contains:\n$files_y files that contain data\n$files_n files that are empty\n$dir_y non-empty directories\n$dir_n empty directories\n"


exit 0