#!/bin/sh

while read arg; do
	echo $arg
	nohup qsurf $arg > /dev/null <&1 2>&1 &
done <> /tmp/qsurf.fifo
