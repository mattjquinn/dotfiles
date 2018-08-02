#!/bin/sh
# ~/.xinitrc

THINKPAD_MODEID="1600x900_60.00"
#E228WFP_MODEID="1680x1050_60.00"
#U2312HM_MODEID="1920x1024_60.00"

THINKPAD_MODELINE=$(cvt 1600 900 60)
#E228WFP_MODELINE=$(cvt 1680 1050 60)
#U2312HM_MODELINE=$(cvt 1920 1024 60)

DZEN2_WIDTH=600
DZEN2_FONT="-*-fixed-medium-r-*-*-14-*-*-*-*-*-*-*"
DZENBAR_LEFT_OFFSET=0

# Initialize all modes now.
xrandr --newmode $(echo "$THINKPAD_MODELINE" | sed -n -e 's/^Modeline\s*//p')
#xrandr --newmode $(echo "$U2312HM_MODELINE" | sed -n -e 's/^Modeline\s*//p')

# eDP1 is internal display; configure it now.
#xrandr --addmode eDP1 "\"$THINKPAD_MODEID\""

# Query xrandr for the status of the output devices.
#XRANDR_QUERY=$(xrandr -q)

# Determine if any displays are connected to VGA1 and HDMI1 based on the query to xrandr.
#VGA1_STATUS=$(echo "$XRANDR_QUERY" | sed -n -e 's/^VGA1\s\([a-z]*\)\s.*$/\1/p')
#HDMI1_STATUS=$(echo "$XRANDR_QUERY" | sed -n -e 's/^HDMI1\s\([a-z]*\)\s.*$/\1/p')

load_dzen_bar () {

	# If a bar was previously spawned, account for its width before spawning a new one.
	if [ $DZENBAR_LEFT_OFFSET -ne 0 ]; then
		DZENBAR_LEFT_OFFSET=$(expr $DZENBAR_LEFT_OFFSET + $DZEN2_WIDTH)

	fi

	DZENBAR_LEFT_OFFSET=$(expr $DZENBAR_LEFT_OFFSET + $(expr $1 - $DZEN2_WIDTH))
	#echo "DZENBAR_LEFT_OFFSET: " $DZENBAR_LEFT_OFFSET
	(sleep 5s && conky -c ~/.conkytop | dzen2 -ta r -x $DZENBAR_LEFT_OFFSET -y '0' -e '' -h '20' -w $DZEN2_WIDTH -bg '#222222' -fn $DZEN2_FONT -p) &
}

## If HDMI1 is connected, start it and place it to the left of the internal display.
#if [ "$HDMI1_STATUS" = "connected" ]; then
#	xrandr --addmode HDMI1 "\"$U2312HM_MODEID\""
#
#	# Horizontal orientation.
#	xrandr --output HDMI1 --mode "\"$U2312HM_MODEID\"" --right-of eDP1
#	load_dzen_bar "1600"
#
#        # Vertical orientation.
#	#xrandr --output HDMI1 --mode "\"$U2312HM_MODEID\"" --rotate left --left-of eDP1
#	#load_dzen_bar "1024"
#
#	echo "[.xinitrc] HDMI1 is connected, placing it to the right of eDP1."
#
#	# Start eDP1 to left of HDMI1.
#	xrandr --output eDP1 --mode "\"$THINKPAD_MODEID\"" --left-of HDMI1
#	load_dzen_bar "1920"
#else
#
#	# If HDMI1 is disconnected, start eDP1 first (will be leftmost display)
#	xrandr --output eDP1 --mode "\"$THINKPAD_MODEID\""
#	load_dzen_bar "1600"
#	echo "[.xinitrc] HDMI1 is disconnected; starting eDP1 first."
#fi

# MQUINN 05-15-2014: Disabling for now, no 2nd monitor available.
#if [ "$VGA1_STATUS" = "connected" ]; then
#	xrandr --addmode VGA1 "\"$U2312HM_MODEID\""
#	xrandr --output VGA1 --mode "\"$U2312HM_MODEID\"" --right-of eDP1
#	load_dzen_bar "1920"
#
#	echo "[.xinitrc] VGA1 is connected, placing it to the right of eDP1."
#fi

# MQUINN 05-14-2017: No external monitors, simplifying script.
xrandr --output eDP1 --mode "\"$THINKPAD_MODEID\""

# STATUS BAR (OLD is Dzen, new is slstatus)
load_dzen_bar "1600"
#(slstatus) &
#(dwmstatus) &
(conky -c ~/.conkyside) &

# Set background image.
# can use --bg-scale here.
feh --bg-max ~/dotfiles/bg_photos/splitmatrix.jpg

xbindkeys
xrdb -merge ~/.Xresources
(redshift) &

while true
  do
  sleep 2
  (exec dwm) &
done
