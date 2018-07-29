#!/bin/bash

# NOTE: This must be run as root. The oracularS3 profile
# is registered with the root account's duply profile, not
# the mquinn user's duply profile (in order to backup system
# files that are owned by root).
#
# ALSO: This script has a hard-link to it in /etc/cron.daily,
# which allows it to be picked up by anacron. Ensure that this script
# has execute permissions and belongs to root:root.

# MQUINN 02-26-2018 : Commenting out for now.
#logger "[MQUINN] Starting script execution..."
#
## Is amazon.com reachable?
#/usr/bin/wget -q --tries=3 --timeout=10 -O - http://www.amazon.com > /dev/null
#wget_ret=$?
#
#logger "[MQUINN] wget return status code: $wget_ret"
#
## If so, run backup.
#if [ "$wget_ret" == 0 ]; then
#  logger "[MQUINN] System is online; executing duply..."
#  /usr/bin/duply oracularS3 backup_purge --force
#  logger "[MQUINN] Duply execution complete."
#else
#  logger "[MQUINN] System is offline; duply will not be called."
#fi
#
#logger "[MQUINN] Script execution has finished."
