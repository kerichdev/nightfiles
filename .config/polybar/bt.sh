#!/usr/bin/env bash
source ~/.config/polybar/colors.sh
DEVICE=`bluetoothctl info | awk -F 'Alias: ' '{print $2}' | tr -d " \t\n"`
ICON=`bluetoothctl info | awk -F 'Icon: ' '{print $2}' | tr -d " \t\n"`
CHARGE=`upower -d | awk -F 'percentage: ' '{print $2}' | tr -d " \t\n" | cut -f1 -d"%"`
round() { awk -v n=$1 -v d=$2 'BEGIN{print int((n+d/2)/d) * d}'; }

CHARGERND=`round $CHARGE 10`

case $CHARGERND in
  0)
	CICON=%{F$COLOR}󰂎%{F-}
	;;

  10)
    CICON=%{F$COLOR}󰁺%{F-}
    ;;

  20)
    CICON=%{F$COLOR}󰁻%{F-}
    ;;

  30)
    CICON=%{F$COLOR}󰁼%{F-}
    ;;

  40)
    CICON=%{F$COLOR}󰁽%{F-}
    ;;

  50)
    CICON=%{F$COLOR}󰁾%{F-}
    ;;

  60)
    CICON=%{F$COLOR}󰁿%{F-}
    ;;

  70)
    CICON=%{F$COLOR}󰂀%{F-}
    ;;

  80)
    CICON=%{F$COLOR}󰂁%{F-}
    ;;

  90)
    CICON=%{F$COLOR}󰂂%{F-}
    ;;

  100)
    CICON=%{F$COLOR}󰁹%{F-}    
    ;;

esac

if [ "$DEVICE" == "" ]
	then echo "%{F$COLOR}󰂲%{F-}"
	else 
		if [ "$ICON" == "audio-headphones" ]
			then echo "%{F$COLOR}󰂰%{F-} $DEVICE"
		else if [ "$ICON" == "input-keyboard" ]
			then echo "%{F$COLOR}󰂱%{F-} $DEVICE ($CICON$CHARGE%)"
		else echo "%{F$COLOR}󰂯%{F-} $DEVICE"
		fi
	fi
fi

#%{F$COLOR}󰂲%{F-}