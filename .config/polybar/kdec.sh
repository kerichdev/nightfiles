#!/bin/bash
source ~/.config/polybar/colors.sh
DEVICEID=`kdeconnect-cli -l --id-only 2>&1 | sed '2,$d'`
DEVICENAME=`kdeconnect-cli -l --name-only 2>&1 | sed '2,$d'`
CHARGE=`gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$DEVICEID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery charge 2>/dev/null| tr -d '(<' | tr -d '>,)' `
CHARGESTATUS=`gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$DEVICEID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery isCharging 2>/dev/null| tr -d '(<' | tr -d '>,)' `
ERRORCHK=`gdbus call --session --dest org.kde.kdeconnect --object-path /modules/kdeconnect/devices/$DEVICEID/battery --method org.freedesktop.DBus.Properties.Get org.kde.kdeconnect.device.battery charge 2>&1 | sed 's/:.*//'`

BATTERY_ICONS=("󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")
BATTERY_ICONS_CHARGING=("󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅")

C_INDEX=$((CHARGE * 11 / 100))

if [ "$C_INDEX" -ge 11 ]; then
        C_INDEX=11
fi

C_ICON=%{F$COLOR}${BATTERY_ICONS[$C_INDEX]}%{F-}
CH_ICON=%{F$COLOR}${BATTERY_ICONS_CHARGING[$C_INDEX]}%{F-}

if [ "$ERRORCHK" == "Error" ]
	then echo "%{F$COLOR}󰄢%{F-}"
	else 
		if [ "$CHARGESTATUS" == "true" ]
			then echo "%{F$COLOR}󰄡%{F-} $DEVICENAME ($CH_ICON$CHARGE%)"
		else echo "%{F$COLOR}󰄡%{F-} $DEVICENAME ($C_ICON$CHARGE%)"
	fi
fi

2>/dev/null
