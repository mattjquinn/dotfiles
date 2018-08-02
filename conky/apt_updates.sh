#!/bin/sh

# -u updates the cache; omitting -u
# will cause simulated upgrade using cache info currently available.
if [ "$1" = "-u" ]; then
	(sudo apt-get update -qq) &
else
	APT_UP_SIM=$(sudo apt-get upgrade -s)
	UPGRADES_AVAIL=$(echo "$APT_UP_SIM" | sed -n -e 's/^\([0-9]*\)\supgraded.*$/\1/p')
	echo "$UPGRADES_AVAIL Available Upgrades"
fi
