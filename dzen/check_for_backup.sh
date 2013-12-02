#!/bin/sh

DUPLICITY_CHECK=$(ps -e | grep duplicity)

if [ -n "$DUPLICITY_CHECK" ]; then
	echo "[Backing up...]"
fi
