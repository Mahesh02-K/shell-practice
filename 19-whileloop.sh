#!/bin/bash

# a=0

# while [ $a -lt 10 ]
# do 
#     echo $a
#     a=`expr $a + 1`
# done

while IFS= read -r line #IFS is internal field seperator, it will check and read each line of the script using read command
do 
    echo $line
done < 20-set.sh #giving 20-set.sh file as input to while loop
