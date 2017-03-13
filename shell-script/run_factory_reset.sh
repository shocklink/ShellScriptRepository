#!/bin/bash
#adb -s $1 reboot

for i in `seq 10000`
do
	echo $i
	adb -s $1 wait-for-device
	adb -s $1 root
	adb -s $1 wait-for-device
	echo Waiting for bootup screen
	while :
	do
		adb -s $1 logcat -b events -d|grep "boot_progress_enable_screen"
		if [ $? -eq 0 ]; then
			break
		fi
		sleep 1
	done
	adb -s $1 wait-for-devices
	adb -s $1 shell "mkdir /cache/recovery"
	adb -s $1 wait-for-device shell "echo \--wipe_data > /cache/recovery/command"
	adb -s $1 wait-for-device shell cat /cache/recovery/command
	adb -s $1 reboot recovery
	sleep 1
done
