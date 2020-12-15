#!/bin/bash
# this is a simple script which scans at a level 4 speed and lists everyting we want of open ports.

if [ "$1" == "" ]
then
echo "ERROR"
echo "Syntax : ./nmap.sh <ip_address>"

else
nmap -T4 -p- $1 > result.txt; # saves the result in a result.txt file
cat result.txt | grep "open" | cut -d " " -f 1 | tr -d "/tcp" > ports.txt;
# it saves just the port numbers into another file
# we use that file and find what the ports do individually 
for port in $(cat ports.txt); do
nmap -T4 -p $port -A $1 >> listing.txt &
done
echo "Please open the file listing.txt to find the result"
fi 


