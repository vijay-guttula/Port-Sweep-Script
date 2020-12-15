#!/bin/bash
# this is a simple script which scans at a level 4 speed and lists everyting we want of open ports.
# please note instead of running this script you can simply run nmap -T4 -p- -A <ipaddress>
# this script is just for undertanding scripting and to understand how we can extract the required lines or words into files for other use.



if [ "$1" == "" ]
then
echo "ERROR"
echo "Syntax : ./nmap.sh <ip_address>"

else
nmap -T4 -p- $1 > result.txt; # saves the result in a result.txt file
cat result.txt | grep "open" | cut -d " " -f 1 | tr -d "/tcp" | tr "\n" "," | sed 's/.$//' > ports.txt;
# We get a huge result but we just extract the lines open using grep and then cut the spaces and focus on the 1st words and then translate them removing the "/tcp" and then again remove the new lines by replacing them with comas and removing the last coma using sed - s/ (Searching) .$(last character) //(Null) so we are replacing the last character with null
# it saves just the port numbers into another file
# we use that file and find what the ports do individually 

nmap -T4 -p $(cat ports.txt) -A $1 ; 
#equivalent to nmap -T4 -p 22,111,etc -A <ipadress>
fi 


