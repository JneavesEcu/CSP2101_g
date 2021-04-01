#!/bin/bash

#Portfolio 1
#Task 2
#Jared Neaves 10064584

#start infinite loop
while :
do
    #get user input with prompt
    read -p "Enter two digit numeric code that is either equal to 20 or equal to 40 : " input
    #start disaster condition checks to break out of loop
    #check if entered string is 2 char long to defeat null and long inputs
    if [ "${#input}" -eq "2" ]; then
        #nested if to check if input was only digits to prevent errors when using -eq check
        if [[ "$input" =~ [[:digit:]] ]]; then
            #check if input was 20 or 40, if true break the loop and give success message
            if [ $input -eq 20 ] || [ $input -eq 40 ]; then
                echo "You entered a valid input"
                break
            else
                #if check got to this point and failed give standard error message
                echo "Your input was invalid, try again"
            fi
        else
        #if string was not all digits give error message
        echo "Your input was invalid, try again (hint: 20 & 40 dont se characters)"
        fi
    else
        #if string was not 2 char give error message
        echo "Your input was invalid, try again (hint: 20 & 40 are 2 digits long)"
    fi
done
exit 0