#!/usr/bin/env bash

eww daemon

monitor=$(hyprctl monitors -j | jaq 'reverse' | jaq '.[0].id')    
eww open bar${monitor}

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r line; do
    case ${line%>>*} in
    "monitorremoved")
    eww open bar0
    ;;
    "monitoradded")
    eww close bar0
    sleep 1
    eww open bar1
    ;;
  esac
done
