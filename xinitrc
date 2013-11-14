#!/bin/sh
# ~/.xinitrc

THINKPAD_MODEID="1600x900_60.00"
E228WFP_MODEID="1680x1050_60.00"

THINKPAD_MODELINE=$(cvt 1600 900 60)
E228WFP_MODELINE=$(cvt 1680 1050 60)

DZEN2_FONT="-*-fixed-medium-r-*-*-14-*-*-*-*-*-*-*"

# Initialize all modes now.
xrandr --newmode $(echo "$THINKPAD_MODELINE" | sed -n -e 's/^Modeline\s*//p')
xrandr --newmode $(echo "$E228WFP_MODELINE" | sed -n -e 's/^Modeline\s*//p')

# eDP1 is internal display; configure it now.
xrandr --addmode eDP1 "\"$THINKPAD_MODEID\""

# Query xrandr for the status of the output devices.
XRANDR_QUERY=$(xrandr -q)

# Determine if any displays are connected to VGA1 and HDMI1 based on the query to xrandr.
VGA1_STATUS=$(echo "$XRANDR_QUERY" | sed -n -e 's/^VGA1\s\([a-z]*\)\s.*$/\1/p')
HDMI1_STATUS=$(echo "$XRANDR_QUERY" | sed -n -e 's/^HDMI1\s\([a-z]*\)\s.*$/\1/p')

# If VGA1 is connected, start it first, then start the internal display to the right of it.
# If VGA1 is disconnected, start the internal display; it will be the leftmost monitor.
if [ "$VGA1_STATUS" = "connected" ]; then
	xrandr --addmode VGA1 "\"$E228WFP_MODEID\""
	xrandr --output VGA1 --mode "\"$E228WFP_MODEID\""
	xrandr --output eDP1 --mode "\"$THINKPAD_MODEID\"" --right-of VGA1
	echo "[.xinitrc] VGA1 is connected, placing eDP1 to the left of it."
else
	xrandr --output eDP1 --mode "\"$THINKPAD_MODEID\""
	echo "[.xinitrc] VGA1 is disconnected; eDP1 is leftmost monitor."
fi

# If HDMI1 is connected, start it and place it to the right of the internal display.
if [ "$HDMI1_STATUS" = "connected" ]; then
	xrandr --addmode HDMI1 "\"$E228WFP_MODEID\""
	xrandr --output HDMI1 --mode "\"$E228WFP_MODEID\"" --right-of eDP1
	echo "[.xinitrc] HDMI1 is connected, placing it to the right of eDP1."
fi

(sleep 2s && conky | dzen2 -ta r -x '1080' -y '0' -e '' -h '20' -w '600' -fg '#66a9ba' -fn $DZEN2_FONT -p) &
(sleep 2s && conky | dzen2 -ta r -x '2080' -y '0' -e '' -h '20' -w '600' -fg '#66a9ba' -fn $DZEN2_FONT -p) &
(sleep 2s && conky | dzen2 -ta r -x '4160' -y '0' -e '' -h '20' -w '600' -fg '#66a9ba' -fn $DZEN2_FONT -p) &


xbindkeys
xrdb -merge ~/.Xresources
exec dwm
