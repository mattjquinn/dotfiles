#!/bin/sh

FILE_COUNT=$(ls -1 ~/0_TO_REVIEW | wc -l)

if [ $FILE_COUNT != "0" ]; then
	echo "[$FILE_COUNT Stg]"
fi
