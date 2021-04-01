#!/bin/bash

#Portfolio 1
#Task 1
#Jared Neaves 10064584

#initialise variable and add the sum of the 3 arguments
sum=$(($1+$2+$3))
#echo " sum is $sum" test and debugging line
#determine if the sum is less than 30 and provide the correct output
    if [ $sum -le 30 ];
    #display output
    then
        echo "The sum of $1 and $2 and $3 is $sum"
    #else the sum was greater than 30 therefore provide the alternate output
    else
    #display output
        echo "Sum exceeds maximum allowable"
    fi

exit 0