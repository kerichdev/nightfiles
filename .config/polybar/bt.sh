#!/usr/bin/env bash
source ~/.config/polybar/colors.sh
DEVICE=`bluetoothctl info | awk -F 'Alias: ' '{print $2}' | tr -d " \t\n"`
ICON=`bluetoothctl info | awk -F 'Icon: ' '{print $2}' | tr -d " \t\n"`
CHARGE=`upower -d | awk -F 'percentage: ' '{print $2}' | tr -d " \t\n" | cut -f1 -d"%"`

BATTERY_ICONS=("󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

C_INDEX=$((CHARGE * 11 / 100))
C_ICON=%{F$COLOR}${BATTERY_ICONS[$C_INDEX]}%{F-}

if [ "$DEVICE" == "" ]
	then echo "%{F$COLOR}󰂲%{F-}"
	else 
		if [ "$ICON" == "audio-headphones" ]
			then echo "%{F$COLOR}󰂰%{F-} $DEVICE ($C_ICON$CHARGE%)"
		else if [ "$ICON" == "input-keyboard" ]
			then echo "%{F$COLOR}󰂱%{F-} $DEVICE ($C_ICON$CHARGE%)"
		else echo "%{F$COLOR}󰂯%{F-} $DEVICE"
		fi
	fi
fi
