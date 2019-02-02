#!/bin/bash

# Called from user's crontab; DO NOT
# run as root or you will get permissions errors
# when duplicacy updates its cache.

logger "[MQUINN] Starting duplicacy wrapper..."

# Is amazon.com reachable?
/usr/bin/wget -q --tries=3 --timeout=10 --spider https://www.google.com
wget_ret=$?

logger "[MQUINN] wget return status code: $wget_ret"

# If so, run backup.
if [ "$wget_ret" == 0 ]; then
  logger "[MQUINN] System is online; running duplicacy..."
  cd /home/mquinn
  /opt/duplicacy_2.1.2/duplicacy backup
  logger "[MQUINN] Duplicacy backup complete."
else
  logger "[MQUINN] System is offline; duplicacy will not be called."
fi

logger "[MQUINN] Duplicacy wrapper has finished."
