#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2 * 100 "% " $3}')
dunstify -a popup -h string:x-canonical-private-synchronous:audio "Volume: $volume" -h int:value:$volume
