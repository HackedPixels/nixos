#!/usr/bin/env bash

# this is currently borken is sequoia

# what wifi are we currently on
LABEL=$(sudo system_profiler SPAirPortDataType | awk '/Current Network Information:/{getline; print $1; exit}' | sed 's/:.*//' | awk '{$1=$1};1')
sketchybar -m --set $NAME label=$LABEL
