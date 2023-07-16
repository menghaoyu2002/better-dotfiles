#!/usr/bin/env bash

echo "{"
playerctl -p spotify metadata | awk '{print $2 " " $3}' | while read -r line; do 
echo ${line:6} | awk '{print "\""$1"\"" ": " "\""$2"\""","}'
done
echo '"status" : "'"$(playerctl -p spotify status)"'"'
echo "}"
