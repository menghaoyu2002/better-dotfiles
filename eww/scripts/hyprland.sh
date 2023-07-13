#!/usr/bin/env bash

NUM_WORKSPACES=8

# get initial focused workspace
focusedws=$(hyprctl -j monitors | jaq -r '.[] | select(.focused == true) | .activeWorkspace.id')

declare -A o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0 [10]=0)
# declare -A monitormap
declare -A workspaces

# handle workspace create/destroy
workspace_event() {
  while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | jaq -jr '.[] | .id, " ", .monitor, "\n"')
}

# generate the json for eww
generate() {
  echo -n '{"workspaces": ['

  for i in $(seq 1 $NUM_WORKSPACES); do
      echo -n ''"$([ "$i" -eq 1 ] || echo ,)" '{"number": '"$i"', "focused": '"$([ "$focusedws" = "$i" ] && echo "true" || echo "false")"', "occupied": '"$([[ "${o[$i]}" = 1 ]] && echo "true" || echo "false")"'}'
  done

  echo ']}'
}

# setup

# add workspaces
workspace_event

# check occupied workspaces
for num in "${!workspaces[@]}"; do
  o[$num]=1
done

# generate initial widget
generate

# main loop
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r line; do
  case ${line%>>*} in
  "workspace")
    focusedws=${line#*>>}
    ;;
  "focusedmon")
    focusedws=${line#*,}
    ;;
  "createworkspace")
    o[${line#*>>}]=1
    ;;
  "destroyworkspace")
    o[${line#*>>}]=0
    ;;
  esac
  generate
done
