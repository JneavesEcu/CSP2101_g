#!/bin/bash

#Portfolio 1
#Task 4
#Jared Neaves 10064584

#make var to get the absolute address of access_log.txt when it exists in the same dir as the script.
file="$(cd "$(dirname $0)" && pwd)/access_log.txt"
#echo "$file" TESTING
#cat $file TESTING
#welcome formatting
echo -e "\nWelcome to searchlog\n"
while true; do #infinite loop to allow multiple searches
    echo ""
    read -p "Enter the pattern you wish to search for: " pattern
    echo -e "\nEnter type of search"
    echo -e "Enter '1' for whole word match search: "
    read -p "Enter '2' for any match on the line: " whole
    if [ "$whole" == "1" ] || [ "$whole" == "2" ]; then #check for expected input
        #echo "type correct" TESTING
        : #no operation
    else
        echo -e "\nError: Incorrect type selection" #error message and break loop
        break
    fi
    echo -e "\nEnter type of match"
    echo -e "Enter '1' for normal match: "
    read -p "Enter '2' for inverted match: " match
    if [ "$match" == "1" ] || [ "$match" == "2" ]; then #check for expected input
        #echo "match correct" TESTING
        : #do nothing
    else
        echo -e "\nError: Incorrect match selection" #error message and break loop
        break
    fi
    
    #set variables for grep search -w for whole word match -v for inverted
    if [ "$whole" == "1" ]; then
        w="-w"
    else
        w=""
    fi
    
    if [ "$match" == "1" ]; then
        v=""
    else
        v="-v"
    fi
    
    #counter and match found or not
    if [ $(eval grep -c -a -i $w $v $pattern $file) -ge 1 ]; then #grep -c finds count, if count greater or equal to 1 then do full search else there were no matches
        echo -e "\n$(eval grep -c -a -i $w $v $pattern $file) matches found\n" #this line uses grep -c to show the number of matches found
        #this is the main search function
        #standard args are -a read as text -i case insensitive -n print with line number
        #variable args are -w or not for whole word search -v or not for inverted search
        eval grep -a -i -n $w $v $pattern $file #eval allows pass all args as string to run in command line
    else
        echo -e "\nNo matches found"
    fi

    #prompt user to find out if they want to continue searching
    echo -e "\nWould you like to search again or exit?"
    echo -e "Enter '1' for search again: "
    read -p "Enter '2' for exit: " check
    if [ "$check" != "1" ]; then #if option is not 1 then break loop (exit)
        break
    else
        :
    fi
done
exit 0
