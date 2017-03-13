#!/system/bin/sh

while :
do
	echo on > /sys/power/state
	sleep 3
	echo mem > /sys/power/state
	sleep 3
done
