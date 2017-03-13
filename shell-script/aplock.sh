#!/bin/sh

#sleep 70

while :
do
	RANDOM=`date '+%s'`
	RANDOM1=$((RANDOM%5))
	RANDOM2=$(((RANDOM/10)%5))
	echo 1 > /sys/power/cpufreq_ceiling
	sleep $RANDOM1
	#echo sleep $RANDOM1

	echo 0 > /sys/power/cpufreq_ceiling
	sleep $RANDOM2
	#echo sleep $RANDOM2
done
