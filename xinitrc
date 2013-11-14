#!/bin/sh
# ~/.xinitrc

THINKPAD_MODELINE=$(cvt 1600 900 60)
THINKPAD_MODEID="1600x900_60.00"
xrandr --newmode $(echo "$THINKPAD_MODELINE" | sed -n -e 's/^Modeline\s*//p')
xrandr --addmode eDP1 "\"$THINKPAD_MODEID\""

E228WFP_MODEID="1680x1050_60.00"
E228WFP_MODELINE=$(cvt 1680 1050 60)
xrandr --newmode $(echo "$E228WFP_MODELINE" | sed -n -e 's/^Modeline\s*//p')
xrandr --addmode HDMI1 "\"$E228WFP_MODEID\""
xrandr --addmode VGA1 "\"$E228WFP_MODEID\""

xrandr --output VGA1 --mode "\"$E228WFP_MODEID\""
xrandr --output eDP1 --mode "\"$THINKPAD_MODEID\"" --right-of VGA1
xrandr --output HDMI1 --mode "\"$E228WFP_MODEID\"" --right-of eDP1

xbindkeys
xrdb -merge ~/.Xresources

DZEN2_FONT="-*-fixed-medium-r-*-*-12-*-*-*-*-*-*-*"
(sleep 2s && conky | dzen2 -ta r -x '1080' -y '0' -e '' -h '20' -w '600' -fg '#66a9ba' -fn '$DZEN2_FONT' -p ) &
exec dwm
