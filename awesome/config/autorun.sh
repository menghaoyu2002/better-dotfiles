#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom -b
xinput --map-to-output 14 eDP1 
run nm-applet --no-agent
