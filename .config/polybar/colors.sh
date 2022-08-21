#!/bin/bash
COLOR=`grep -FA7 "[colors]" ~/.config/polybar/config.ini | sed -n '5p' | sed 's/.*= //'`