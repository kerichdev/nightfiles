#!/bin/bash
source ~/.config/polybar/colors.sh
PAUSESTATUS=`dunstctl is-paused`
if [ "$PAUSESTATUS" == "true" ]
	then echo "%{F$COLOR}󰪓%{F-}"
else echo "%{F$COLOR}󰂜%{F-}"
fi

#%{F$COLOR}󰂲%{F-}