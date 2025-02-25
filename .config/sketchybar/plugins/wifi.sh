#!/bin/bash

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
. $PLUGIN_DIR/colors.sh

SSID="$(system_profiler SPAirPortDataType | awk '/Current Network Information:/ { getline; print substr($0, 13, (length($0) - 13)); exit }')"

if [ "$SSID" = "" ]; then
#   sketchybar --set $NAME label="Disconnected" icon=睊
  sketchybar --set $NAME icon=󰖪 \
                         icon.color=$RED
else
#   sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=直
  sketchybar --set $NAME icon=󰖩 \
                         icon.color=$FGALT
fi
