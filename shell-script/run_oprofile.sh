#!/bin/sh -x
#adb shell cat /proc/kallsyms |grep "T _text"
#adb shell cat /proc/kallsyms |grep _etext

adb shell opcontrol --setup
for i in `seq 1000`
do
	adb shell ps|grep oprofiled|awk '{print $2}'|xargs -i adb shell kill -9 {}
	adb shell "opcontrol --vmlinux=/vmlinux --kernel-range=0xc003b000,0xc060d000 --event=CPU_CYCLES:100000" &
	adb shell ps|grep oprofiled
	echo round $i start
	adb shell opcontrol --start
	sleep 3
	adb shell opcontrol --stop

	./external/oprofile/opimport_pull -r ~/FriendStreamProfile/script/$i > ~/FriendStreamProfile/script/$i.txt
	echo round $i finish
	adb shell opcontrol --shutdown
done
