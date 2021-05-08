#!/bin/bash

#Portfolio 2
#Task 1
#Jared Neaves 10064584

#initialise both arrays
ass1=(12 18 20 10 12 16 15 19 8 11)
ass2=(22 29 30 20 18 24 25 26 29 30)

#initialise loop that adds array results together at the same index and outputs the result
#"${#ass1[@]}" is used to determine the max length of the loop by the length of the first array
#easy to edit in case array values become non static in the script - otherwise could just use "i<10"
for (( i=0 ; i < "${#ass1[@]}" ; i++)); do
    added=$((${ass1[$i]}+${ass2[$i]}))
    #format correct output of results
    echo "Student_$(($i+1)) Result: $added"
done

exit 0
