#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom -b
xinput --map-to-output "ELAN Touchscreen" eDP1 
run nm-applet --no-agent
