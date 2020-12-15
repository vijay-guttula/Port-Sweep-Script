#!/bin/bash

nmap -T4 -p- $1 > result.txt; # saves the result in a result.txt file
cat result.txt | grep "open" | cut -d " " -f 1 | tr -d "/tcp" > ports.txt;
# it saves just the port numbers into another file

# we use that file and find what the ports do individually 
for port in $(cat ports.txt); do
nmap -T4 -p $port -A $1 &
done



