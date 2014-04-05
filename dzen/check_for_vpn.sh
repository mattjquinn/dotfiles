#!/bin/sh

OPENVPN_CHECK=$(ps -e | grep openvpn)

if [ -n "$OPENVPN_CHECK" ]; then
	echo "*VPN*"
fi
