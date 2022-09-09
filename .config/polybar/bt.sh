#!/usr/bin/env bash
source ~/.config/polybar/colors.sh
COUNT_CONNECTED=`seq $(bluetoothctl devices Connected | wc -l)` #5.65 and up
DEVICE=`bluetoothctl info | awk -F 'Alias: ' '{print $2}' | tr -d " \t\n"`

OUTPUTARRAY=()
FINAL=()
LOOPWATCHDOG=0

for COUNT in $COUNT_CONNECTED; do
	OUTPUTARRAY+=($(bluetoothctl devices Connected | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done | grep "Icon\|Battery Percentage\|Connected" | sed -n -e 's/^.*Icon: //p' | sed -n ${COUNT}p) $(bluetoothctl devices Connected | cut -f2 -d' ' | while read uuid; do bluetoothctl info $uuid; done | grep "Icon\|Battery Percentage\|Connected" | sed -n -e 's/^.*Battery Percentage: //p' | sed -n ${COUNT}p | sed 's/(\(.*\))/\1/' | sed 's/[^ ]* //'))
done

for ELEMENT in ${OUTPUTARRAY[@]}; do
	case $ELEMENT in
		"input-keyboard") FINAL+=("%{F$COLOR}󰌌%{F-}" ${OUTPUTARRAY[LOOPWATCHDOG+1]}%)
		((LOOPWATCHDOG=LOOPWATCHDOG+2))
		FINAL+=("• ")
		;;
		"audio-headphones") FINAL+=("%{F$COLOR}󰋋%{F-}" ${OUTPUTARRAY[LOOPWATCHDOG+1]}%)
		((LOOPWATCHDOG=LOOPWATCHDOG+2))
		FINAL+=("• ")
		;;
		"audio-card") FINAL+=("%{F$COLOR}󰓃%{F-}" ${OUTPUTARRAY[LOOPWATCHDOG+1]}%)
		((LOOPWATCHDOG=LOOPWATCHDOG+2))
		FINAL+=("• ")
		;;
		"audio-headset") FINAL+=("%{F$COLOR}󱡏%{F-}" ${OUTPUTARRAY[LOOPWATCHDOG+1]}%)
		((LOOPWATCHDOG=LOOPWATCHDOG+2))
		FINAL+=("• ")
		;;
	esac
done

unset FINAL[-1]

if [ "$DEVICE" == "" ]
	then echo "%{F$COLOR}󰂲%{F-}"
	else 
		echo ${FINAL[@]} | awk '{$1=$1};1' | sed 's/󰓃%{F-} %/󰓃%{F-}/g'
fi

#%{F$COLOR} %{F-}
