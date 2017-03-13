#!/bin/sh
#APP=310000,  339280
#EBI=310000,  339280
#mmFAB=303743,339280
#
#


for i in afab ebi1 mmfab sfab dfab
do
	echo !!!!!!$i\*!!!!!!
	#adb shell cat /sys/kernel/debug/clk/$i\_a_clk/rate
	#sleep 1
	adb shell cat /sys/kernel/debug/clk/$i\_clk/rate
	#adb shell cat /sys/kernel/debug/clk/$i\_clk/measure
	sleep 1
#	adb shell cat /sys/kernel/debug/clk/$i\*/rate
#	sleep 1
done
