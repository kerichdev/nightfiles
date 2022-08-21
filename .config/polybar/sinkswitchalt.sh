#!/bin/bash
#sinkswitch alternative
SINK=`pactl get-default-sink`
SINKNUM=`pactl list short sinks | xargs | tr " " "\n" | awk 'NR % 7 == 2' | grep -Fn "$SINK" | cut -f1 -d":"`
SINKLIST=`pactl list short sinks | xargs | tr " " "\n" | sed -n '2~7p'`
SINKNUMTOTAL=`pactl list short sinks | xargs | tr " " "\n" | sed -n '2~7p' | wc -l`

# if sunknum is sinknumtotal, then set sink at number 1, else set sink from sinknum+1

if (( $SINKNUM == $SINKNUMTOTAL )); then
	pactl set-default-sink $(pactl list short sinks | xargs | tr " " "\n" | sed -n '2~7p' | sed '1q;d')
else 
	pactl set-default-sink $(pactl list short sinks | xargs | tr " " "\n" | sed -n '2~7p' | sed "$(($SINKNUM+1)) q;d")
fi