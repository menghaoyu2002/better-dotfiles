#!/usr/bin/env bash

coverart=$(cat ./coverart)

echo "{"
playerctl -p spotify metadata | while read -r line; do 

line=${line#*:} 
value=$(echo ${line#*' '} | xargs -0 | tr -d '"')
key=$(echo ${line%"$value"} | xargs)

if [[ $key = "artUrl" && $coverart != $value ]]; then
    curl -sS $value > ./coverart.png
    coverart=$value
    echo $coverart > ./coverart
fi

echo '"'$key'"':  '"'$value'"'','

done

echo '"volume": "'"$(playerctl -p spotify volume)"'",'

echo '"status": "'"$(playerctl -p spotify status)"'",'
echo '"coverart": "./coverart.png",'

echo '"shuffle": "'"$(playerctl -p spotify shuffle)"'",'
echo '"loop": "'"$(playerctl -p spotify loop)"'",'
length=$(playerctl -p spotify metadata --format "{{ duration(mpris:length)}}")
echo '"length_str": "'"$length"'",'
echo '"length_seconds": "'"$(echo $length | awk -F ":" '{ print $1 * 60 + $2}')"'",'

echo '"position_seconds": "'"$(playerctl -p spotify position)"'",'
echo '"position_str": "'"$(playerctl -p spotify position --format "{{ duration(position) }}")"'"'
echo "}"
