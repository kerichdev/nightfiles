#!/bin/bash
source ~/.config/polybar/colors.sh
ACTIVE=`xdotool getactivewindow getwindowclassname 2>/dev/null`
ACTIVENAME=`xdotool getactivewindow getwindowname 2>/dev/null`

case ${ACTIVE,,} in
	'google-chrome')
	echo %{F$COLOR}󰊯%{F-} Google Chrome
	;;
	'telegramdesktop')
	echo %{F$COLOR}󰠢%{F-} Telegram
	;;
	'alacritty')
	echo %{F$COLOR}󰆍%{F-} Alacritty
	;;
	'org.gnome.nautilus')
	echo %{F$COLOR}󰉕%{F-} Nautilus
	;;
	'discord')
	echo %{F$COLOR}󰙯%{F-} Discord
	;;
	'steam')
	echo %{F$COLOR}󰓓%{F-} Steam
	;;
	'blueberry.py')
	echo %{F$COLOR}󰂳%{F-} Blueberry
	;;
	'gnome-disks')
	echo %{F$COLOR}󰋊%{F-} Gnome Disks
	;;
	'pavucontrol')
	echo %{F$COLOR}󰘮%{F-} Pavucontrol
	;;
	'kdeconnect.app')
	echo %{F$COLOR}󰄡%{F-} KDE Connect
	;;
	'youtube music')
	echo %{F$COLOR}󱖏%{F-} Youtube Music
	;;
	'easyeffects')
	echo %{F$COLOR}󰓃%{F-} EasyEffects
	;;
	'vlc')
	echo %{F$COLOR}󰕼%{F-} VLC
	;;
	'subl')
	echo %{F$COLOR}󰯃%{F-} Sublime Text
	;;
	*)
	echo %{F$COLOR}󱂬%{F-} $ACTIVENAME
	;;
esac

#%{F#$COLOR}󰂲%{F-}

