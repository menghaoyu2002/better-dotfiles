#!/bin/bash

brightness=$(brightnessctl i | grep % | awk '{print $4}' | tr -d "(%)")
dunstify -a popup -h string:x-canonical-private-synchronous:audio "Brightness: $brightness%" -h int:value:$brightness
