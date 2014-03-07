#!/bin/bash

# NOTE: This must be run as root. The oracularS3 profile
# is registered with the root account's duply profile, not
# the mquinn user's duply profile (in order to backup system
# files that are owned by root).

wget -q --tries=3 --timeout=10 -O - http://www.amazon.com > /dev/null
if [[ $? -eq 0 ]]; then
  echo "System is online; calling duply..."
  duply oracularS3 backup_purge --force
else
  echo "System is offline; skipping call to duply."
fi

