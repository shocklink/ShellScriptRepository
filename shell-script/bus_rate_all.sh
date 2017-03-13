#!/bin/sh -x

for i in $(adb shell ls /sys/kernel/debug/clk | sed 's///g')
do 
	echo $i
	adb shell cat /sys/kernel/debug/clk/$i/rate
done
