#!/bin/sh

DUPLICACY_CHECK=$(ps -e | grep duplicacy)

if [ -n "$DUPLICACY_CHECK" ]; then
	echo "[Backing up...]"
fi
