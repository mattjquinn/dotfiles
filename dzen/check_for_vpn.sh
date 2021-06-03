#!/bin/sh

OPENVPN_LOCATION=$({
  ps -ef |
  grep -v "grep" |    # exclude our own grep command
  grep 'openvpn' |
  sed -r 's/^.*\/([A-Za-z0-9_ ]+)\.ovpn.*$/\1/' |
  head -n 1
})

if [ -n "$OPENVPN_LOCATION" ]; then
	echo "$OPENVPN_LOCATION"
fi
