#!/bin/bash
source ~/.config/polybar/colors.sh
DEVICEID=`kdeconnect-cli -l --id-only 2>&1 | sed '2,$d'`
DEVICENAME=`kdeconnect-cli -l --name-only 2>&1 | sed '2,$d'`
CHARGE=`gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$DEVICEID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery charge 2>/dev/null| tr -d '(<' | tr -d '>,)' `
CHARGESTATUS=`gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$DEVICEID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery isCharging 2>/dev/null| tr -d '(<' | tr -d '>,)' `
ERRORCHK=`gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$DEVICEID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery charge 2>&1 | sed 's/:.*//'`


round() { awk -v n=$1 -v d=$2 'BEGIN{print int((n+d/2)/d) * d}'; }
if [ "$ERRORCHK" == "Error" ]
	then echo "%{F$COLOR}󰄢%{F-}"
	else 
	CHARGERND=`round $CHARGE 10`

	case $CHARGERND in
	  0)
		CICON=%{F$COLOR}󰂎%{F-}
		CHICON=%{F$COLOR}󰢟%{F-}
		;;

	  10)
	    CICON=%{F$COLOR}󰁺%{F-}
	    CHICON=%{F$COLOR}󰢜%{F-}
	    ;;

	  20)
	    CICON=%{F$COLOR}󰁻%{F-}
	    CHICON=%{F$COLOR}󰂆%{F-}
	    ;;

	  30)
	    CICON=%{F$COLOR}󰁼%{F-}
	    CHICON=%{F$COLOR}󰂇%{F-}
	    ;;

	  40)
	    CICON=%{F$COLOR}󰁽%{F-}
	    CHICON=%{F$COLOR}󰂈%{F-}
	    ;;

	  50)
	    CICON=%{F$COLOR}󰁾%{F-}
	    CHICON=%{F$COLOR}󰢝%{F-}
	    ;;

	  60)
	    CICON=%{F$COLOR}󰁿%{F-}
	    CHICON=%{F$COLOR}󰂉%{F-}
	    ;;

	  70)
	    CICON=%{F$COLOR}󰂀%{F-}
	    CHICON=%{F$COLOR}󰢞%{F-}
	    ;;

	  80)
	    CICON=%{F$COLOR}󰂁%{F-}
	    CHICON=%{F$COLOR}󰂊%{F-}
	    ;;

	  90)
	    CICON=%{F$COLOR}󰂂%{F-}
	    CHICON=%{F$COLOR}󰂋%{F-}
	    ;;

	  100)
	    CICON=%{F$COLOR}󰁹%{F-}
	    CHICON=%{F$COLOR}󰂅%{F-}  
	    ;;

esac
		if [ "$CHARGESTATUS" == "true" ]
			then echo "%{F$COLOR}󰄡%{F-} $DEVICENAME ($CHICON$CHARGE%)"
		else echo "%{F$COLOR}󰄡%{F-} $DEVICENAME ($CICON$CHARGE%)"
	fi
fi

2>/dev/null